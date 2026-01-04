class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.3.3/subcog-0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "a513b95393da379ad356349832978e199274bde88e102c9ca654359da1d7bb8a"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.3.3/subcog-0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "882b4c8ff178180ce604fc77a393a4888700b71bc2db5d633afb5720f47ee4c7"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.3.3/subcog-0.3.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "01fbc86f3b344478a1473a40bee7a203045876a4e1ba7ea4fea50d05e2d181d4"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
