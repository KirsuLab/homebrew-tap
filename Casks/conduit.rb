cask "conduit" do
  version "1.8.0"
  sha256 "26357e171eeef5cc97622005129d0f8c3d6afcaddf425020cb438984b73b2380"

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
