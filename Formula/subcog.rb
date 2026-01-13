class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.0/subcog-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "ea67f2af8f303ba72551ad0b1613672df71ec321ee35526a960b664dad273693"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.0/subcog-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "5f856bfff0169f097919d3a48da00a043b7a1aea0bdf825c4486e803527eef54"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.0/subcog-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4b5614375a5d0f4830eec1ae92d8e9e5c41d38e064b400754cdbb9b1d3bd1dd"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
