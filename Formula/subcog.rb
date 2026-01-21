class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.13.1/subcog-0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "9fc10994d4e8046285260fc41600d27e352fcbadc15d459ea12d8cdc4b1ae074"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.13.1/subcog-0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "17537691ad526e60caebcf0bec989c09ffd2a6f1ab1b3d5e9c17105c3e8eaddd"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.13.1/subcog-0.13.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "03f7fa79a78ddd3a59c0d28800bac1491ed8e18f53fc9cef800c44388f75d5f2"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
