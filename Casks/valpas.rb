cask "valpas" do
  version "1.0"
  sha256 "3514e519584c3e4dccda091142ff59cc072ece795577ae9971c76412e2723bac"

  url "https://github.com/KirsuLab/valpas-releases/releases/download/v#{version}/Valpas-#{version}.dmg",
      verified: "github.com/KirsuLab/valpas-releases/"
  name "Valpas"
  desc "Menu bar app that keeps a computer awake on a timer"
  homepage "https://kirsulab.com/macos/valpas"

  depends_on macos: :ventura

  app "Valpas.app"

  zap trash: [
    "~/Library/Application Scripts/com.kirsulab.valpas",
    "~/Library/Containers/com.kirsulab.valpas",
  ]
end
