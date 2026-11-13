cask "paella" do
  version "1.0.0"
  sha256 "2eec98875dcddc39ac1e675833a983c1de4e9650fd5b99fc87805732b5fe54e7"

  url "https://github.com/arcester/paella/releases/download/v#{version}/Paella-#{version}.zip"
  name "Paella"
  desc "Menu bar thermostat for fanless MacBook Air"
  homepage "https://github.com/arcester/paella"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Paella.app"

  uninstall launchctl: "com.guzman.Paella.watchdog",
            quit:      "com.guzman.Paella"

  zap delete: "/etc/sudoers.d/paella",
      trash:  [
        "~/Library/Application Support/Paella",
        "~/Library/LaunchAgents/com.guzman.Paella.watchdog.plist",
        "~/Library/Preferences/com.guzman.Paella.plist",
      ]
end
