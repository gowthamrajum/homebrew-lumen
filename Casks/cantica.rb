# typed: strict
# frozen_string_literal: true

cask "cantica" do
  arch arm: "arm64", intel: "x64"

  version "0.2.23"

  on_arm do
    sha256 "43e71c6689b7589eb4de06e602929d20293ab2d8720176c57786b67f9f2b1f5e"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Cantica-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "16c9766fd54ca679d14376a3994c2be2fbf536911e484885faac1cb3e1c55951"

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
