# Gryt Chat, for Homebrew

```bash
brew tap Gryt-chat/tap
brew trust Gryt-chat/tap
brew install --cask gryt-chat
```

The `brew trust` line is not optional. Homebrew refuses to load a cask from a
third-party tap until you say you trust it, and the refusal reports itself as
`invalid syntax in tap!`, which reads like a broken package rather than a
permission you have not granted yet.

Apple silicon only for now, macOS 12 or later. There is no Intel build yet, so
the cask refuses on Intel rather than installing something that cannot run.

The app updates itself, so `brew upgrade` leaves it alone.

## How this repository is updated

`Casks/gryt-chat.rb` is written by `publish-homebrew.yml` in
[Gryt-chat/gryt](https://github.com/Gryt-chat/gryt) on every stable release. It
copies `packaging/homebrew/gryt-chat.rb` from that repository and fills in the
version and the checksum.

Edit the cask there, not here. A change made here is overwritten by the next
release.
