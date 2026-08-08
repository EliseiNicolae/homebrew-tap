# Snapix Homebrew tap

Install [Snapix](https://snapix.app) — a screen capture tool for macOS with
annotation, blur and on-device text recognition — with Homebrew.

## Install

```sh
brew install --cask eliseinicolae/tap/snapix
```

That one command adds the tap and installs the app. Naming the cask in full is
what makes it a single step: Homebrew 6.0 and later refuse to load casks from
third-party taps until they are trusted, but a fully-qualified name counts as
saying so, so no separate `brew trust` is needed.

Afterwards the tap is yours, and the short forms work for anything else:

```sh
brew install snapix          # --cask is optional; there is no formula by this name
brew uninstall snapix
```

## Requirements

macOS 14 (Sonoma) or later.

## Updates

Snapix updates itself through Sparkle, so the cask is marked `auto_updates` and
`brew upgrade` deliberately leaves it alone. To force Homebrew to reinstall the
current release anyway:

```sh
brew upgrade --cask --greedy snapix
```

## Uninstall

```sh
brew uninstall --cask snapix
```

To remove preferences, caches, capture history and saved credentials as well:

```sh
brew uninstall --cask --zap snapix
```

`--zap` cannot clear Keychain entries, so a saved sign-in token outlives it.

## Notes

The cask points at the notarized `.dmg` on `cdn.snapix.app` and pins its
checksum; nothing is hosted here. Version checks read the app's Sparkle feed at
`https://snapix.app/appcast.xml`.
