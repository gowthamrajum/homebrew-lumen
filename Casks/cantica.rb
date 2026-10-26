# typed: strict
# frozen_string_literal: true

cask "cantica" do
  arch arm: "arm64", intel: "x64"

  version "0.2.52"

  on_arm do
    sha256 "c1eabbd11cbbc036befef3b94ab139010d18979cd364f6630c5a9edc43043633"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Cantica-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "deb423a3d8078106cb3fd8d38bc7c392f6cb6b48edaa04dbc434785b430c5e7f"

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
