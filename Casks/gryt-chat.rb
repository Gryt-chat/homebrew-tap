# version and both sha256 values are placeholders. publish-homebrew.yml
# rewrites all three.
cask "gryt-chat" do
  arch arm: "arm64", intel: "x64"

  version "1.13.35"
  # Two different placeholders because `brew style` rejects identical per-arch
  # checksums, and because a leftover one is then obvious in the published cask.
  sha256 arm:   "0daae7fffca6d27994c5922c4bed89be91f60b96a89babb04899fa0e6183119c",
         intel: "d5f0ec096f6dd185797ac0b4fb5200935534524e9c0b891e4df8befdf50f9be5"

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
