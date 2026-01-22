class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.14.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.14.3/subcog-0.14.3-x86_64-apple-darwin.tar.gz"
      sha256 "e0ac8d66120db107d18f80da5befd2507fb9efb3ed3547dbd8f23c5252bc5c3a"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.14.3/subcog-0.14.3-aarch64-apple-darwin.tar.gz"
      sha256 "41c68c6108c87e8a952db1a35e3850fd8419b7a8a863db4286ac828c2f56fc0a"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.14.3/subcog-0.14.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c3a6715067fe52848236fd1f3d3ab6288431bd363fefc5a067f3839220185608"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
