# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_sle
# reboot = false
# strategy = configure
# complexity = low
# disruption = medium

# sssd configuration files must be created with 600 permissions if they don't exist
# otherwise the sssd module fails to start
OLD_UMASK=$(umask)
umask u=rw,go=

{{{ bash_ensure_ini_config("/etc/sssd/sssd.conf", "pam", "offline_credentials_expiration", "1") }}}

umask $OLD_UMASK
