#!/bin/sh

echo "Checking latest version"

LATEST_VERSION=$(gh api repos/brave/brave-browser/releases/latest | jq -r .tag_name | cut -c2-)

echo "Latest version is: $LATEST_VERSION"

CURRENT_VERSION=$(grep version= template | cut -c9-)

echo "Current template version is: $CURRENT_VERSION"

if [ "$LATEST_VERSION" = "$CURRENT_VERSION" ]; then
  echo "No update required"
  exit 0
fi

VERSION="$LATEST_VERSION"
DOWNLOAD_URL="https://github.com/brave/brave-browser/releases/download/v${VERSION}/brave-browser_${VERSION}_amd64.deb"

echo "Downloading Brave to get checksum"

gh release download -R brave/brave-browser -p "*amd64.deb" --output "brave-bin.deb"

CHECKSUM=$(sha256sum ./brave-bin.deb | awk '{ print $1 }')

echo "Checksum computed"

rm ./brave-bin.deb

VERSION="$VERSION" CHECKSUM="$CHECKSUM" envsubst '${VERSION} ${CHECKSUM}' < ./template.template > template

echo "Template updated"
