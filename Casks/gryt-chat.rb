# version and both sha256 values are placeholders. publish-homebrew.yml
# rewrites all three.
cask "gryt-chat" do
  arch arm: "arm64", intel: "x64"

  version "1.15.12"
  # Two different placeholders because `brew style` rejects identical per-arch
  # checksums, and because a leftover one is then obvious in the published cask.
  sha256 arm:   "81d6e6b1fd82357e256bd2ba2883c6b253c4890e817f2d88a629c1eb76bcbe60",
         intel: "acc18dc36ab0cde4af1a61ecd2ada58e774460b3202462034a2de9009031a215"

  url "https://github.com/Gryt-chat/gryt/releases/download/v#{version}/Gryt-Chat-#{version}-mac-#{arch}.dmg"
  name "Gryt Chat"
  desc "Real-time voice chat"
  homepage "https://gryt.chat/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Without this, brew upgrade reinstalls over a copy electron-updater has
  # already moved on.
  auto_updates true
  depends_on macos: :monterey

  app "Gryt Chat.app"

  # Only on --zap, never on an ordinary uninstall: this holds the identity
  # keypair, and losing it loses every server the person had joined.
  zap trash: [
    "~/Library/Application Support/Gryt Chat",
    "~/Library/Caches/com.gryt.chat",
    "~/Library/Caches/com.gryt.chat.ShipIt",
    "~/Library/HTTPStorages/com.gryt.chat",
    "~/Library/Preferences/com.gryt.chat.plist",
    "~/Library/Saved Application State/com.gryt.chat.savedState",
  ]
end
