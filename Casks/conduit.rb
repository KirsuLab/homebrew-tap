cask "conduit" do
  version "1.9.0"
  sha256 "00ebc6891d78668d88d09efba6bff5d660ed291d476dcb91c9f131b8e956d777"

  url "https://github.com/KirsuLab/conduit/releases/download/v#{version}/Conduit-#{version}.dmg"
  name "Conduit"
  desc "File manager for Android phones, cameras and SD cards over USB or Wi-Fi"
  homepage "https://kirsulab.com/macos/conduit"

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
