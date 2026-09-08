# Gryt Chat, for Homebrew

```bash
brew install --cask Gryt-chat/tap/gryt-chat
```

Apple silicon only. There is no Intel build, so the cask refuses rather than
installing something that cannot run. macOS 12 or later.

The app updates itself, so `brew upgrade` leaves it alone.

## How this repository is updated

`Casks/gryt-chat.rb` is written by `publish-homebrew.yml` in
[Gryt-chat/gryt](https://github.com/Gryt-chat/gryt) on every stable release. It
copies `packaging/homebrew/gryt-chat.rb` from that repository and fills in the
version and the checksum.

Edit the cask there, not here. A change made here is overwritten by the next
release.
