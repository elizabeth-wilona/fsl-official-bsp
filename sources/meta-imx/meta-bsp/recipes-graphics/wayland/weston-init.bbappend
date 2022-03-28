FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://profile"

INI_UNCOMMENT_ASSIGNMENTS_append_mx8ulp = " \
    use-g2d=1 \
"

WATCHDOG_SEC = "40"
WATCHDOG_SEC_mx8ulp = "240"

update_file() {
    if ! grep -q "$1" $3; then
        bbfatal $1 not found in $3
    fi
    sed -i -e "s,$1,$2," $3
}

do_install_append() {
    install -Dm0755 ${WORKDIR}/profile ${D}${sysconfdir}/profile.d/weston.sh

    # Add weston.log back, used by NXP for testing
    update_file "ExecStart=/usr/bin/weston " "ExecStart=/usr/bin/weston --log=\$\{XDG_RUNTIME_DIR\}/weston.log " ${D}${systemd_system_unitdir}/weston.service

    # FIXME: weston should be run as weston, not as root
    update_file "User=weston" "User=root" ${D}${systemd_system_unitdir}/weston.service
    update_file "Group=weston" "Group=root" ${D}${systemd_system_unitdir}/weston.service

    update_file "WatchdogSec=20" "WatchdogSec=${WATCHDOG_SEC}" ${D}${systemd_system_unitdir}/weston.service
}
