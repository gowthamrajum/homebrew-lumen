# typed: strict
# frozen_string_literal: true

cask "lumen-presenter" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"

  on_arm do
    sha256 "2980094f66795692edb42cd1858385e8b2b6586d92ce5f7bb401d12d31cee0b7"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Lumen-Presenter-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "d0f65d2765b4db60d69e47ccbb5c08c1b1c3dcba9959b34d69fa8573a9531b65"

    url "https://github.com/gowthamrajum/lumen-presenter/releases/download/v#{version}/Lumen-Presenter-#{version}.dmg"
  end

  name "Lumen Presenter"
  desc "Open worship / church presentation app (ProPresenter style)"
  homepage "https://github.com/gowthamrajum/lumen-presenter"

  app "Lumen Presenter.app"

  # Unsigned open-source build: clear the download quarantine so it launches
  # without a Gatekeeper prompt (no $99 Apple account needed).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Lumen Presenter.app"]
  end

  zap trash: [
    "~/Library/Application Support/lumen-presenter",
    "~/Library/Logs/Lumen Presenter",
    "~/Library/Preferences/com.lumen.presenter.plist",
  ]
end
