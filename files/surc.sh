surc () {
    [ "$1" = "-" ] && shift
    local USER="$1"
    local DISTRIB_ID=""
    if [ -r "/etc/lsb-release" ]; then
        DISTRIB_ID="$(awk -F'=' '$1 == "DISTRIB_ID" { print $2 }' /etc/lsb-release 2>/dev/null)"
    fi
    [ -z "${USER}" ] && USER="root"
    chmod +x "${SSHHOME}" 2>/dev/null
    if [ "${DISTRIB_ID}" = "Ubuntu" ]; then
        sudo -u "${USER}" SSHHOME="${SSHHOME}" "${SSHHOME}/bashsshrc"
    else
        (
            export SSHHOME
            su -s "${SSHHOME}/bashsshrc" "${USER}"
        )
    fi
}

alias ssu='surc'
