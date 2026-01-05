class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.5.0/subcog-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "85a8761283e50244afe43cc3b192822a118b6ba74abb11e093404e82028bc6b6"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.5.0/subcog-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "a0781aa44bc71b44509b8c64f071c3eeec8ab8354ab61abbc9487c09233f5fe6"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.5.0/subcog-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b1fb86fd9a4ffae862812edfb3b4fe388364d9bd481325b96d083cc6764e726f"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
