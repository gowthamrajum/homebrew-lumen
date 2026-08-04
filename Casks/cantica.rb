# typed: strict
# frozen_string_literal: true

cask "cantica" do
  arch arm: "arm64", intel: "x64"

  version "0.2.30"

  on_arm do
    sha256 "f7007c29e34dfd3e445ef583eaf1c4bc76ade873dcff19a01d69cbe18dbf1e37"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Cantica-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ebc1fa8f021c8ccda32f3532ead1c7589e6a30d1ad20f5ec89bc907e9ef7ff24"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Cantica-#{version}.dmg"
  end

  name "Cantica"
  desc "Open worship / church presentation app (ProPresenter style)"
  homepage "https://github.com/gowthamrajum/lumen-presenter"

  app "Cantica.app"

  # Unsigned open-source build: clear the download quarantine so it launches
  # without a Gatekeeper prompt (no $99 Apple account needed).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cantica.app"]
  end

  zap trash: [
    "~/Library/Application Support/Cantica",
    "~/Library/Logs/Cantica",
    "~/Library/Preferences/org.teluguchurchdfw.cantica.plist",
  ]
end
