class GitAdr < Formula
  desc "Architecture Decision Records management for git repositories using git notes"
  homepage "https://github.com/zircote/git-adr"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zircote/git-adr/releases/download/v1.0.0/git-adr-aarch64-apple-darwin.tar.gz"
      sha256 "86b40f066d8a943cd29ddc56ce52bb2266c40994f8fa43cea560ebc5bccade80"
    end
    on_intel do
      url "https://github.com/zircote/git-adr/releases/download/v1.0.0/git-adr-x86_64-apple-darwin.tar.gz"
      sha256 "be678f4185b54deda040df20e272378da1b9010d793ea2a208f85cc91e8fee1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zircote/git-adr/releases/download/v1.0.0/git-adr-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1863d48a9dbf2ac97ed8aa49830e72566bedd07494cc8e7aa8b34f2050be0b82"
    end
    on_intel do
      url "https://github.com/zircote/git-adr/releases/download/v1.0.0/git-adr-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92939be016aeb87c89c1b60e54c6ed5c5bd4e4282968eb32aac7d9734053406e"
    end
  end

  def install
    bin.install "git-adr"
  end

  test do
    system "#{bin}/git-adr", "--version"
  end
end
