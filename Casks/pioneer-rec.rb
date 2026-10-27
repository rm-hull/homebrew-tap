# This file is the template for the Homebrew cask.
# On release, the workflow fills in the version and SHA256 checksums.
cask "pioneer-rec" do
  version "0.1.2"

  on_macos do
    on_arm do
      sha256 "8d41d09f6918cf5ead341a0397dd347f642ef5a29d4dcb2b6239a731250e8a77"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}-darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "67a8a03564281c6ba1957b5d016deabaa181f3059842895b7f9cec27c48adad4"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}-darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "163fa04706c1c186a5c56dae7828a6e6c7a87145a0872b0fc53ea9f10b1566d9"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}-linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "1d4a0547915a429449b1f4fdb7bae7bf87ce41d01f5a62deed16596f7dfdc464"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}-linux_amd64.tar.gz"
    end
  end

  name "pioneer-rec"
  desc "Recover video recordings from failed Pioneer DVR and Sony HXD recorder hard drives."
  homepage "https://github.com/rm-hull/pioneer-rec"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "pioneer_rec"
  binary "pioneer_rec_520"
  binary "pioneer_rec_545"
  binary "pioneer_rec_550"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/pioneer_rec"]
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/pioneer_rec_520"]
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/pioneer_rec_545"]
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/pioneer_rec_550"]
    end
  end

  # No zap stanza required
end
