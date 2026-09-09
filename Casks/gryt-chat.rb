# version and both sha256 values are placeholders. publish-homebrew.yml
# rewrites all three.
cask "gryt-chat" do
  arch arm: "arm64", intel: "x64"

  version "1.11.4"
  # Two different placeholders because `brew style` rejects identical per-arch
  # checksums, and because a leftover one is then obvious in the published cask.
  sha256 arm:   "cc0eaf6b45a14dd0c2106eeb94edaaa347c5ea2fb564f7eb1b4390806ac9b104",
         intel: "cfecb352e0db2c557fc4d7a25da8ef7f3f8ff4a9d43fdd35d1c4568a6d82c8bc"

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
