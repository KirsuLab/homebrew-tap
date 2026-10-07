cask "valpas" do
  version "1.3"
  sha256 "4396e185008463430f2a971c56f309b6a37242aa816f36caade446b3e056d909"

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
