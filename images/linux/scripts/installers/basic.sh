#!/bin/bash -e
################################################################################
##  File:  basic.sh
##  Desc:  Installs basic command line utilities and dev packages
################################################################################
# shellcheck source=/images/linux/scripts/helpers/install.sh
source "$HELPER_SCRIPTS"/install.sh
# shellcheck source=/images/linux/scripts/helpers/os.sh
source "$HELPER_SCRIPTS"/os.sh

common_packages=$(get_toolset_value .apt.common_packages[])
cmd_packages=$(get_toolset_value .apt.cmd_packages[])
for package in $common_packages $cmd_packages; do
    echo "Install $package"
    apt-get install -y --no-install-recommends "$package"
done

invoke_tests "Apt"
