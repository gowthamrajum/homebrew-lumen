# typed: strict
# frozen_string_literal: true

cask "cantica" do
  arch arm: "arm64", intel: "x64"

  version "0.2.44"

  on_arm do
    sha256 "89036cea44de1ed912b96d6ec1233d74ba308d5010a1ff2fc78d9ce007c0e422"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Cantica-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "4d9dffaadf179bfd708f11bd8d8c19f8b32f999af84f20efe035be0249dfa65d"

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
