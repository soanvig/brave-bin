#!/usr/bin/fish

echo "Checking latest version"

set LATEST_VERSION (gh api repos/brave/brave-browser/releases/latest | jq -r .tag_name | cut -c2-)

echo "Latest version is: $LATEST_VERSION"

set -x VERSION $LATEST_VERSION
set -x DOWNLOAD_URL https://github.com/brave/brave-browser/releases/download/v{$VERSION}/brave-browser_{$VERSION}_amd64.deb

echo "Downloading Brave to get checksum"

http --print "" --download $DOWNLOAD_URL > /tmp/brave-bin.deb

set -x CHECKSUM (sha256sum /tmp/brave-bin.deb | awk '{ print $1 }')

echo "Checksum computed"

envsubst '${VERSION} ${CHECKSUM}' < ./template.template > template

echo "Template updated"