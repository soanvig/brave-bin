**You can use the [Flatpak instead](https://flathub.org/apps/details/com.brave.Browser), which probably is more secure and easier way to install Brave**

# brave-bin package for Void Linux

This package provides Brave Browser, the browser based on Chromium with privacy in mind and a built in ad blocker. This package merely takes the .deb release version from the authors, extracts and installs the files as is. Plus, ensures the dependencies are there. **Note:** This is not building binaries from source as a proper package should. Hence the `-bin` shuffix.

The template file is prepared for use with [xbps-src](https://wiki.voidlinux.org/Xbps-src) in Void Linux.


## Installation
```
git clone https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
# Do the above once if not done already.
# Copy this `brave-bin` folder under `srcpkgs` folder, then...
./xbps-src pkg brave-bin
sudo xbps-install --repository hostdir/binpkgs brave-bin
```

## Updating template version

Template version can be updated by running `update-template.fish` script.

Dependencies:

1. `fish` (shell)
2. `gh` (GitHub CLI)
3. `sha256sum`
4. `envsubst` (part of `gettext`)
5. `httpie`


**Help from:**

- [Brave PR for Void Linux](https://github.com/void-linux/void-packages/pull/5511/files)
- [iridium-deb PKGBUILD (AUR)](https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=iridium-deb)

## Credits

- Originally from [reback00's "void-goodies" repo](https://notabug.org/reback00/void-goodies).  All I do is keep this package more up to date.
