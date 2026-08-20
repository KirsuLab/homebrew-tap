cask "valpas" do
  version "1.0"
  sha256 "378999d17f739b90b46b6075a7ff6674a83e05a29686dd76d1be2083a0a5f4c9"

  url "https://github.com/KirsuLab/valpas-releases/releases/download/v#{version}/Valpas-#{version}.dmg",
      verified: "github.com/KirsuLab/valpas-releases/"
  name "Valpas"
  desc "Menu bar app that keeps a computer awake on a timer"
  homepage "https://kirsulab.com/macos/valpas"

  depends_on macos: :ventura

  app "Valpas.app"
  binary "valpas"

  zap trash: [
    "~/Library/Application Scripts/com.kirsulab.valpas",
    "~/Library/Containers/com.kirsulab.valpas",
  ]
end
