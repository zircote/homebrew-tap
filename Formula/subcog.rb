class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.14.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.14.6/subcog-0.14.6-x86_64-apple-darwin.tar.gz"
      sha256 "7a26633a474c0753729654f2f607123918cab7588a94206f67d2a7ea44be79bb"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.14.6/subcog-0.14.6-aarch64-apple-darwin.tar.gz"
      sha256 "7ed5e4f5a736163286980660344de1d30b14d4ad6522b4e9d9d6eec98c0104db"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.14.6/subcog-0.14.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3e4c0518e26e730eb8c5ba7642ab0be428751f6abae061870c342fa063ae51dc"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
