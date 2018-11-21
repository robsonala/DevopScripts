#!/bin/bash
# ******************************************
# Program: PHP Installation
# Developer: Robson Alviani <robsonala[at]gmail.com>
# Date: 20-11-2018
# ******************************************

RET_CODE_OK=0
RET_CODE_ERROR=1

if [ $(id -u) -ne 0 ]; then
    echo "$0: Run it as root";
    exit $RET_CODE_ERROR;
fi

# Help / Usage function
print_help() {
    echo ""
    echo "$0: PHP installation for Ubuntu / Debian / CentOS"
    echo ""
    echo "Usage"
    echo "    [-h] Print help"
    echo "    [-r] (OPTIONAL) Revert installation"
    exit $RET_CODE_ERROR;
}

echo "Starting process..."

while test -n "$1"; do
 case "$1" in
 --help|-h)
 print_help
 exit 0
 ;;
 -r)
 R_ARG=true
 echo "Revert mode activated"
 #shift
 ;;
 *)
 echo "$0: Unknown Argument: $1"
 exit $RET_CODE_ERROR;
 ;;
 esac
 
 shift
done

distro=$(lsb_release -is)
codename=$(lsb_release -cs)

case $distro in
Debian|Ubuntu)
    if [ "$codename" = "trusty" ] || [ "$codename" = "xenial" ] || [ "$codename" = "bionic" ]
    then
        if [ "$R_ARG" ]; then
            apt-get remove -y php7.2-fpm php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml
            add-apt-repository --remove ppa:ondrej/php -y
            apt-get remove -y language-pack-en-base
            apt-get autoremove -y
        else
            apt-get install -y language-pack-en-base
            LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php -y
            apt-get update -y
            apt-get install -y php7.2-fpm php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml
            apt-get autoremove -y
        fi
    else
        echo "$0: Version of $distro not supported ($version / $codename)"
    fi
    ;;
CentOS)
    echo "$0: TODO $distro"
    ;;
*)
    echo "$0: Not supported distro ($distro)"
    ;;
esac

echo "Finished..."

exit $RET_CODE_OK;