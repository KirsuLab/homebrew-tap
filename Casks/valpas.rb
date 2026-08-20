cask "valpas" do
  version "1.0"
  sha256 "d89b35b078997b3f089250ac8efdefd689557b2249fb6d96b78bf6fb91c7dc71"

  url "https://github.com/KirsuLab/valpas-releases/releases/download/v#{version}/Valpas-#{version}.dmg",
      verified: "github.com/KirsuLab/valpas-releases/"
  name "Valpas"
  desc "Menu bar app that keeps a computer awake on a timer"
  homepage "https://kirsulab.com/macos/valpas"

  depends_on macos: :ventura

  app "Valpas.app"
  binary "valpas"

  postflight do
    # Launch Services индексирует свежепоставленное приложение не мгновенно, а
    # команда valpas адресует его по идентификатору: пока индекс не обновился,
    # первая команда после установки уходит в никуда. Регистрируем сразу.
    system_command "/System/Library/Frameworks/CoreServices.framework/" \
                   "Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "#{appdir}/Valpas.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/com.kirsulab.valpas",
    "~/Library/Containers/com.kirsulab.valpas",
  ]
end
