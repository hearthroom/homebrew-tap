# This file is managed by GoReleaser from hearthroom/cli; releases overwrite it.
cask "hearthroom" do
  desc "Command-line client for Hearthroom character cards"
  homepage "https://cli.hearthroom.club"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/hearthroom/cli/releases/download/v#{version}/hearthroom_#{version}_darwin_arm64.tar.gz"
      sha256 "705aae50b140f0fd767d7a9c8838d75dc220fdf61a99eaf9b61b782aa459e92c"
    end
    on_intel do
      url "https://github.com/hearthroom/cli/releases/download/v#{version}/hearthroom_#{version}_darwin_amd64.tar.gz"
      sha256 "c7a02ab45a4503ac0b15ace4587072646277a370b7c65e2a5f18c94f0311c45b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/hearthroom/cli/releases/download/v#{version}/hearthroom_#{version}_linux_arm64.tar.gz"
      sha256 "04371c90f0239e80926482f1297c9edec578f75274bf1a31d2d9d049ddfc4f2f"
    end
    on_intel do
      url "https://github.com/hearthroom/cli/releases/download/v#{version}/hearthroom_#{version}_linux_amd64.tar.gz"
      sha256 "f8ce8366ab818d3bdfa49c94bd0a4252eefc9f9e068a912acad5c6307e67a3b8"
    end
  end

  binary "hearthroom"
  binary "completions/hearthroom.bash", target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/hearthroom"
  binary "completions/hearthroom.zsh", target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_hearthroom"
  binary "completions/hearthroom.fish", target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/hearthroom.fish"

  # The binaries are not notarized; drop the quarantine flag Homebrew adds to
  # cask downloads so Gatekeeper does not block the first run.
  postflight do
    if system_command("/usr/bin/xattr", args: ["-h"]).exit_status == 0
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/hearthroom"]
    end
  end
end
