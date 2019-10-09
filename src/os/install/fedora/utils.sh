#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_key() {

    # Don't use this command on Fedora
    return 1

    # wget -qO - "$1" | sudo apt-key add - &> /dev/null
    #       │└─ write output to file
    #       └─ don't show output

}

add_ppa() {

    # Don't use this command on Fedora
    return 1

    #sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {

    # Don't use this command on Fedora
    return 1

    #sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
}

autoremove() {

    # Remove packages that were automatically installed to satisfy
    # dependencies for other packages and are no longer needed.

    execute \
        "sudo dnf autoremove --assumeyes --quiet"

}

install_package() {

    declare -r EXTRA_ARGUMENTS="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo dnf install --best --assumeyes --quiet $EXTRA_ARGUMENTS $PACKAGE" "$PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

package_is_installed() {
    dnf list installed "$1" &> /dev/null
}

update() {

    # Resynchronize the package index files from their sources.

    execute \
        "sudo dnf makecache --quiet"

}

upgrade() {

    # Install the newest versions of all packages installed.

    execute \
        "sudo dnf distro-sync --assumeyes --quiet"

}
