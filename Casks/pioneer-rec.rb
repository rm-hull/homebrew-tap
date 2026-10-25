# This file is the template for the Homebrew cask.
# On release, the workflow fills in the version and SHA256 checksums.
cask "pioneer-rec" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "2e78c1459de6ad35390838340109a388502cdc0b35380c36bbaf4b890f57c745"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "47dd925ab39768e5a2dd7e4633352a41ac5086a517a28d8f15c5962b4d5e8470"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "a315f655a65c487cc7509777644d77fd9be551096f6abbe1d99ef85f0cc539b0"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "06d00ca139992c35e183214a4e177ec877eebc58db088f96837ece55bd258f96"
      url "https://github.com/rm-hull/pioneer-rec/releases/download/v#{version}/pioneer-rec-v#{version}_linux_amd64.tar.gz"
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

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/pioneer_rec"]
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/pioneer_rec_520"]
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/pioneer_rec_545"]
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/pioneer_rec_550"]
    end
  end

  # No zap stanza required
end
