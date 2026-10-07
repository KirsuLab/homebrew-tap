cask "valpas" do
  version "1.4"
  sha256 "41a344ddf2c4c8332f58b0e16276b781ec1c8b6ae7b6764ef201ae817fd3257b"

  url "https://github.com/KirsuLab/valpas-releases/releases/download/v#{version}/Valpas-#{version}.dmg"
  name "Valpas"
  desc "Menu bar app that keeps a computer awake on a timer"
  homepage "https://kirsulab.com/macos/valpas"

  depends_on macos: :ventura

  app "Valpas.app"
  binary "valpas"

  postflight do
    # Приложение приезжает с карантином Homebrew, и первая проверка Gatekeeper
    # занимает секунды. Пока она идёт, команда valpas адресует приложение,
    # которого для системы ещё нет, и первая же команда после установки уходит
    # в никуда. Открыть его здесь значит пройти проверку один раз на установке,
    # а не на глазах у человека. Заодно Valpas показывает свою панель: он menu
    # bar утилита, и делает это ровно один раз за всю жизнь.
    system_command "/usr/bin/open", args: ["-g", "-a", "#{appdir}/Valpas.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/com.kirsulab.valpas",
    "~/Library/Containers/com.kirsulab.valpas",
  ]
end
