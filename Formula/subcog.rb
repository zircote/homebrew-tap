class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "87ceebed36cac49c8d65c3a3e03e24d40a1e6f496be149260d0e9d42cfe8fccb"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "b08e197422b8f4e11c1349f74a07ace01e2822c5a8a22960135df74f9dc00222"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "628fe06a95554a7d2a9a90d428e0178cb8dcacd5a173def1d117ddc5e6adc4fd"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
