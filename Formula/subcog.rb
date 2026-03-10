class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.15.1/subcog-0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "56f47b22fee3be2f70908d61f56f9c6ea10cec316907cb9694bf5e6a6407466f"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.15.1/subcog-0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "328f7eb430c4ddf3cfbdc7a894b1a8edc8eb9bfcd2bfcae963551f11711d84d1"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.15.1/subcog-0.15.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0acaba0fe4da0bddab4f6580546ab9bf331634756f63cda1c2cc4692e8dcb90a"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
