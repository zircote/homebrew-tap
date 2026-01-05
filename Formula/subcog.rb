class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.5.1/subcog-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "d7874ce68dce2446a3a5757d56219ea4bbe0bcb373370b305cdac0d857b7c6e1"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.5.1/subcog-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "e525fa14762efa7a311b2c811d4c794de10b4ff92e2e6ef493cbaef74fe8c909"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.5.1/subcog-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b4066082c876b85837b6255de3c662bf69496f5d1b9ea81b4893a23a32669c39"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
