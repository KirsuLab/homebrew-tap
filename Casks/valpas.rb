cask "valpas" do
  version "1.0.1"
  sha256 "cd0f1fc65cdcefbefc5aad75251d74041e118cb9443a8cbfb570d5f611a43d93"

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
