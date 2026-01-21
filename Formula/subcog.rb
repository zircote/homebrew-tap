class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.14.0/subcog-0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "cd06fe0bbf20539a9e10d915b0a4222fd2d00cb3ee224a1052f297a38fbe2d58"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.14.0/subcog-0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "cfcc44526caaddd76352401f95f143ac2829ae107a7ed38cc99a2c509da143bb"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.14.0/subcog-0.14.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "98cad2f921000be194f281b10b0a360f1cc53df59995484ad6463fc4315d84d6"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
