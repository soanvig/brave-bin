**You can use the [Flatpak instead](https://flathub.org/apps/details/com.brave.Browser), which probably is more secure and easier way to install Brave**

# brave-bin package for Void Linux

This package provides Brave Browser, the browser based on Chromium with privacy in mind and a built in ad blocker. This package merely takes the .deb release version from the authors, extracts and installs the files as is. Plus, ensures the dependencies are there. **Note:** This is not building binaries from source as a proper package should. Hence the `-bin` shuffix.

The template file is prepared for use with [xbps-src](https://wiki.voidlinux.org/Xbps-src) in Void Linux.


## Installation & update

```
# Setup - do it once if not done already:
git clone https://github.com/void-linux/void-packages
cd void-packages
./xbps-src binary-bootstrap
git clone https://github.com/soanvig/brave-bin ./srcpkgs/brave-bin

# To install and update Brave:
git -C ./srcpkgs/brave-bin pull
./xbps-src pkg brave-bin
sudo xbps-install --repository hostdir/binpkgs brave-bin
```

## Auto update

The repository is automatically updated to the latest Brave stable release using Github Actions schedule.
By repeating installation commands described above you can update your Brave installation.

## Updating template version (repository development only!)

Template version can be updated by running `update-template.fish` script.

Dependencies:

1. `fish` (shell)
2. `gh` (GitHub CLI)
3. `sha256sum`
4. `envsubst` (part of `gettext`)
