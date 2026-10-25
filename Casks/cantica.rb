# typed: strict
# frozen_string_literal: true

cask "cantica" do
  arch arm: "arm64", intel: "x64"

  version "0.2.50"

  on_arm do
    sha256 "ab99db3f1e32ce7842e91cff863bc194983b867f1ee0cf0149f1888e1599a21f"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Cantica-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "83cc58b18605733645a61f159873d0a5434a5e8812dd71713b5220f7428f3fb0"

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
