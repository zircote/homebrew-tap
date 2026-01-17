class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.9.1/subcog-0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "bf51d75240b3749eec1a768d0c9b789a41c02a823696442833e6cadac4a35eb3"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.9.1/subcog-0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "3fd9df5ca6da12b63699b7b4b3604930d4a979edd71eb4dd791a47c7f7845559"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.9.1/subcog-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0d5d5bc50b4ba7f3f31a6236b856e5fb824cf909ce8cd420858bf936c4f2c7ac"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
