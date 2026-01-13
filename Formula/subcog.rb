class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.1/subcog-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "d20b2f326c3fd71fcfc087bf5ad931f45929d557239d7b18cbaaa0ba34b45ba2"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.1/subcog-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "1c032e5391c0cc81a9e2cdf5c085986f24468850035d5327ec7b694fddc7e208"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.1/subcog-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "45ced14214628eba54f7962163981133b07acc20b89460a832c04846f6573eed"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
