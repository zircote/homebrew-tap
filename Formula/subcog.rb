class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "f65226d41a16be5487720fe84b990a62e9d9bdf3c87e67f2c6964fbdec4c8de6"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "b126f10d03e2c5db568ba8bfef6d806c2636de715242e3bdbfdb191ab80b6c4f"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "78e25f74ce2b0d089255534384d0c17f8a3227d74bcb35f670d4e00968fc506a"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
