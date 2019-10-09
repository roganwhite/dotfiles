#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Build Essentials\n\n"

# Install tools for compiling/building software from source.
install_package "Development Tools" "@development-tools"


# Software which is not included by default
# in Fedora due to legal or copyright reasons.
install_package "Fedora RPM Fusion (Free)" "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
install_package "Fedora RPM Fusion (Non-Free)" "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
