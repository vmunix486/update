#!/bin/sh
#
# Installer for the update script
#


# Root Check

if [ "$(id -u)" -ne 0 ]; then
	echo "Plz run as root or install will crash out"
	exit 1
fi

set -e

INSTALL_DIR="/usr/bin"
SCRIPT_NAME="update"
REPO_URL="https://github.com/vmunix486/update"
RAW_URL="https://raw.githubusercontent.com/vmunix486/update/main/update"

usage() {
    echo "Usage: $0 {git|curl|wget|local <file>}"
    echo
    echo "Options:"
    echo "  git        Clone from GitHub repo"
    echo "  curl       Download with curl"
    echo "  wget       Download with wget"
    echo "  local FILE Install from a local file"
    exit 1
}

if [ $# -lt 1 ]; then
    usage
fi

method=$1
shift

case "$method" in
    git)
        echo "Cloning repo from $REPO_URL..."
        tmpdir=$(mktemp -d)
        git clone "$REPO_URL" "$tmpdir"
        install -m 755 "$tmpdir/update.sh" "$INSTALL_DIR/$SCRIPT_NAME"
        rm -rf "$tmpdir"
        ;;
    curl)
        echo "Downloading with curl..."
        curl -fsSL "$RAW_URL" -o "/tmp/$SCRIPT_NAME"
        install -m 755 "/tmp/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
        rm "/tmp/$SCRIPT_NAME"
        ;;
    wget)
        echo "Downloading with wget..."
        wget -q "$RAW_URL" -O "/tmp/$SCRIPT_NAME"
        install -m 755 "/tmp/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
        rm "/tmp/$SCRIPT_NAME"
        ;;
    local)
        if [ $# -lt 1 ]; then
            echo "Missing local file path"
            usage
        fi
        src=$1
        echo "Installing from local file: $src"
        install -m 755 "$src" "$INSTALL_DIR/$SCRIPT_NAME"
        ;;
    *)
        usage
        ;;
esac

echo "Installed as $INSTALL_DIR/$SCRIPT_NAME"

