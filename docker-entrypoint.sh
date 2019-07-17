#!/bin/bash
set -e

# version_greater A B returns whether A > B
function version_greater() {
	[[ "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1" ]];
}

# return true if specified directory is empty
function directory_empty() {
    [ -n "$(find "$1"/ -prune -empty)" ]
}

function run_as() {
  if [[ $EUID -eq 0 ]]; then
    su www-data -s /bin/bash -c "$1"
  else
    bash -c "$1"
  fi
}

installed_version="0.0.0~unknown"
if [ -f /var/www/html/version.php ]; then
    installed_version=$(php -r 'require "/var/www/html/version.php"; echo "$OC_VersionString";')
fi
image_version=$(php -r 'require "/usr/src/nextcloud/version.php"; echo "$OC_VersionString";')

if version_greater "$installed_version" "$image_version"; then
    echo "Can't start Nextcloud because the version of the data ($installed_version) is higher than the docker image version ($image_version) and downgrading is not supported. Are you sure you have pulled the newest image version?"
    exit 1
fi

if version_greater "$image_version" "$installed_version"; then
    if [ "$installed_version" != "0.0.0~unknown" ]; then
        run_as 'php /var/www/html/occ app:list' > /tmp/list_before
    fi
    if [[ $EUID -eq 0 ]]; then
      rsync_options="-rlDog --chown www-data:root"
    else
      rsync_options="-rlD"
    fi
    rsync $rsync_options --delete --exclude /config/ --exclude /data/ --exclude /custom_apps/ --exclude /themes/ /usr/src/nextcloud/ /var/www/html/

    for dir in config data custom_apps themes; do
        if [ ! -d /var/www/html/"$dir" ] || directory_empty /var/www/html/"$dir"; then
            rsync $rsync_options --include /"$dir"/ --exclude '/*' /usr/src/nextcloud/ /var/www/html/
        fi
    done

    if [ "$installed_version" != "0.0.0~unknown" ]; then
        run_as 'php /var/www/html/occ upgrade'

        run_as 'php /var/www/html/occ app:list' > /tmp/list_after
        echo "The following apps have beed disabled:"
        diff <(sed -n "/Enabled:/,/Disabled:/p" /tmp/list_before) <(sed -n "/Enabled:/,/Disabled:/p" /tmp/list_after) | grep '<' | cut -d- -f2 | cut -d: -f1
        rm -f /tmp/list_before /tmp/list_after
    else
        run_as 'php /wait-for-mysql.php'
        echo "Auto configuration"
        run_as 'php /var/www/html/index.php'
        run_as 'php /var/www/html/occ config:system:set trusted_domains 2 --value=${DOMAIN}'
        run_as 'php /var/www/html/occ app:enable user_ldap'
        run_as 'php /var/www/html/occ ldap:create-empty-config'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapHost ldap'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapPort 389'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapAgentName cn=admin,dc=home'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapAgentPassword ${LDAP_ADMIN_PASSWORD}'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapBase dc=home'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapBaseGroups dc=home'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapBaseUsers dc=home'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapUserFilter "(|(objectclass=person))"'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapLoginFilter "(&(|(objectclass=person))(|(uid=%uid)(|(mailPrimaryAddress=%uid)(mail=%uid))(|(cn=%uid))))"'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapLoginFilterAttributes cn'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapLoginFilterEmail 1'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapLoginFilterername 1'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapGroupFilter "(|(cn=nextcloud))"'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapExperiencedAdmin 1'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapUserDisplayName sn'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapUserFilterObjectclass person'
        run_as 'php /var/www/html/occ ldap:set-config s01 ldapConfigurationActive 1'
        run_as 'php /var/www/html/occ app:enable files_external'
        run_as 'php /var/www/html/occ files_external:create --config datadir="/media" "/Media" "local" "null::null"'

    fi
fi

exec "$@"
