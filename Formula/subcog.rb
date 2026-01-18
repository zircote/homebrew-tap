class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.9.2/subcog-0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "80f3e8cad5b3535ee21fed47ac46c17ff57b04e6713dfed53524bece429547b6"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.9.2/subcog-0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "786fe9291d69dbd228c3499b01016aba89287aa63d170a9a692ce2f413578127"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.9.2/subcog-0.9.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3d57bf03d172ee55e62e3ec3070199ff6ceebc0eb6acecc173db6c89748f1ae4"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
