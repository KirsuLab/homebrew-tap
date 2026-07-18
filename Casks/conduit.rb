cask "conduit" do
  version "1.8.1"
  sha256 "e8ada459163b44a6b81af8b05cee7d69afba8cd93c45746ce229380c350a9f82"

  url "https://github.com/KirsuLab/conduit/releases/download/v#{version}/Conduit-#{version}.dmg",
      verified: "github.com/KirsuLab/conduit/"
  name "Conduit"
  desc "Android file manager over USB or Wi-Fi"
  homepage "https://kirsulab.com/macos/conduit"

  depends_on macos: :catalina

  app "Conduit.app"

  zap trash: [
    "~/Library/Application Support/Conduit",
    "~/Library/Preferences/app.conduit.mac.plist",
    "~/Library/Saved Application State/app.conduit.mac.savedState",
  ]

  caveats <<~EOS
    Conduit needs Google's adb (Android platform-tools) to talk to your phone.
    If you don't have it yet:
      brew install --cask android-platform-tools
    Then enable Developer options and USB debugging on the phone.
  EOS
end
