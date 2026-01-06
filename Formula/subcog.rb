class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.0-rc3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc3/subcog-0.6.0-rc3-x86_64-apple-darwin.tar.gz"
      sha256 "189925c812633201c841123b0448e19a2e18e5e04955fe4b058cca28b215f7a3"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc3/subcog-0.6.0-rc3-aarch64-apple-darwin.tar.gz"
      sha256 "618c8665b43036f67dca56c7cb78caab224fedc3f56e0dc2dc59d144c96fc60b"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc3/subcog-0.6.0-rc3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3109c497b2268b720f18f75bbb790f1b8e10155b97bc342207b2332054df7ef0"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
