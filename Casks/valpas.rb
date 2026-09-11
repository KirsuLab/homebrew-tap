cask "valpas" do
  version "1.1.1"
  sha256 "eafee7e1f9508f1e8715b68fd06de1c9ab251489065b7553fc0e055f90ffe9cb"

  url "https://github.com/KirsuLab/valpas-releases/releases/download/v#{version}/Valpas-#{version}.dmg",
      verified: "github.com/KirsuLab/valpas-releases/"
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
