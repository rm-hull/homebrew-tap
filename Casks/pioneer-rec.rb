# This file is the template for the Homebrew cask.
# On release, the workflow fills in the version and SHA256 checksums.
cask "pioneer-rec" do
  version "0.1.1"

  on_macos do
    on_arm do
      sha256 "0235adeaa5c74c0772a7ed296659f6c232ab0c0651edda17a49849dc786da742"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}-darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "05b17a4efb312063304062f681f2adf7d6e675b6b5aac3f0476f7696f22f52de"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}-darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "c9a371d8254f8b416eb724a65067efc742b04e948e50edb92c43b68451f1168d"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}-linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "467af8a8981e2982267459d436103a956dc238049ab9f8401266f800be740650"
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
