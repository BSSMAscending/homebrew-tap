cask "binary-media-art-beta" do
  version "2.0.0-beta.1"

  on_arm do
    sha256 "f477f6a0078fef46a387bbf1705b86b69651256f505cb92f3786dbd5a41d7214"
    url "https://github.com/BSSMAscending/media-art-beta/releases/download/v#{version}/media-art-for-windows-darwin-arm64-#{version}.zip"
  end
  on_intel do
    sha256 "53ae61cc043b27914230cc612977922bf3016ee03653ce4c82c2bf0685e3b69d"
    url "https://github.com/BSSMAscending/media-art-beta/releases/download/v#{version}/media-art-for-windows-darwin-x64-#{version}.zip"
  end

  name "Binary Media Art Beta"
  desc "Unsigned beta of the exhibit. Not the Windows release used on the floor."
  homepage "https://bssmascending.github.io/media-art-for-windows/#beta"

  app "media-art-for-windows.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/media-art-for-windows.app"]
    run "/usr/bin/codesign",
        args: ["--force", "--deep", "-s", "-", "{{appdir}}/media-art-for-windows.app"]
  end

  caveats <<~EOS
    This is a beta, not the Windows exhibit release.
    It is not notarized. The cask removes quarantine and ad-hoc signs the app during install.
    It does not update itself. The next beta is `brew upgrade --cask binary-media-art-beta`.
  EOS
end
