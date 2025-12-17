class GitAdr < Formula
  desc "Architecture Decision Records management using git notes"
  homepage "https://github.com/zircote/git-adr"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/zircote/git-adr/releases/download/v0.2.1/git-adr-macos-arm64.tar.gz"
      sha256 "bf0d1325c033de6331b6b527c05c199007c22189bd894045d8d64fdd6c0f159b"
    end

    on_intel do
      # Intel Macs: No binary available, Homebrew will fail
      # Use: pip install git-adr
      odie "Pre-built binaries not available for Intel Macs. Use: pip install 'git-adr[all]'"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zircote/git-adr/releases/download/v0.2.1/git-adr-linux-x86_64.tar.gz"
      sha256 "3dfac963314c285e1e6ccda9ea59178aa8d6f0c476fb6854c97da3605382b2e3"
    end
  end

  def install
    # PyInstaller onedir mode: binary + _internal directory must stay together
    # Note: Homebrew auto-strips the single top-level directory from tarballs
    libexec.install "git-adr"
    libexec.install "_internal"
    bin.install_symlink libexec/"git-adr"
  end

  def caveats
    <<~EOS
      To use git-adr as a git subcommand, add this alias:
        git config --global alias.adr '!git-adr'

      Then you can use: git adr <command>
    EOS
  end

  test do
    system bin/"git-adr", "--version"
  end
end
