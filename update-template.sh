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
CHECKSUM=$(gh release view -R brave/brave-browser --json assets | jq -r '.assets | map(select(.name | test("brave-browser.+amd64.deb$"))) | first | .digest' | cut -d':' -f2)
VERSION="$VERSION" CHECKSUM="$CHECKSUM" envsubst '${VERSION} ${CHECKSUM}' < ./template.template > template

echo "Template updated"
