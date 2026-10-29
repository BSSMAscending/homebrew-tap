cask "binary-media-art-beta" do
  version "2.0.0-beta.3"

  on_arm do
    sha256 "52b092f9ef5aea6a8cb5b196da2df21285238b7a0b9eacefc9dd2128dd269bde"
    url "https://github.com/BSSMAscending/media-art-beta/releases/download/v#{version}/media-art-for-windows-darwin-arm64-#{version}.zip"
  end
  on_intel do
    sha256 "7afd1e3416742376b255de21329aa2e1fd8e445f85f9359252d2125c7e18aa00"
    url "https://github.com/BSSMAscending/media-art-beta/releases/download/v#{version}/media-art-for-windows-darwin-x64-#{version}.zip"
  end

  name "Binary Media Art Beta"
  desc "Beta of the exhibit. Not the Windows release used on the floor."
  homepage "https://bssmascending.github.io/media-art-for-windows/#beta"

  app "media-art-for-windows.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/media-art-for-windows.app"]
  end

  caveats <<~EOS
    This is a beta, not the Windows exhibit release.
    It is not notarized. The cask removes quarantine during install.
    The app offers each new beta and installs it with brew upgrade.
  EOS
end
