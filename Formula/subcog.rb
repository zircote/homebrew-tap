class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.14.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.14.7/subcog-0.14.7-x86_64-apple-darwin.tar.gz"
      sha256 "3e0c3b32f53b20c3e53c2252b9801d523b79d96132eb55f77ce9eee2da19dbcc"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.14.7/subcog-0.14.7-aarch64-apple-darwin.tar.gz"
      sha256 "62acae35928372660874890c5e459a400304eb4e13cd2643ccb0c05e794327d3"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.14.7/subcog-0.14.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c5591aec6a9d3d70dbe1c4d5e00279448272a04f717ac3845ca23b07d87cf100"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
