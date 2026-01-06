class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.0-rc3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc3/subcog-0.6.0-rc3-x86_64-apple-darwin.tar.gz"
      sha256 "16e0849944af3d30e91fb0dd0283be7ae77d54debe772339ff8f0f859c49dc88"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc3/subcog-0.6.0-rc3-aarch64-apple-darwin.tar.gz"
      sha256 "f599950b6c248b7c204a8ca8762390338df9b830c58a763d17c1d767ce3728e2"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc3/subcog-0.6.0-rc3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39b5fa4feac5cfba6a0140cbd6139f2d5d6d7e14a28db2918b76debda8dfbcd5"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
