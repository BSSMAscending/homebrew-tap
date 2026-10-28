cask "binary-media-art-beta" do
  version "2.0.0-beta.2"

  on_arm do
    sha256 "068262185141c93af0e2fc512951eeae655bede6ca5e5e23b3393566fe156d0c"
    url "https://github.com/BSSMAscending/media-art-beta/releases/download/v#{version}/media-art-for-windows-darwin-arm64-#{version}.zip"
  end
  on_intel do
    sha256 "ec1ff5926f976e8af5cc25f253c852dd191b05757dd0fdf515f4ea4f3f9657c5"
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
