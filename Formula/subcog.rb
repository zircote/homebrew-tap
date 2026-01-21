class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.13.0/subcog-0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "cf2c8369acb144bd6ca16c8d01436d2994962eebea9a34a9ad267f6a7403ba8d"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.13.0/subcog-0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "9175a34f0df7b871b71addb567b13bc8f69a530259249bb713a4b1ff1c73bc29"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.13.0/subcog-0.13.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3041d4d87726377656a4305344fc511834053fc8743a36df2d85960cac408f76"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
