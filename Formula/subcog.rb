class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.0-rc4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc4/subcog-0.6.0-rc4-x86_64-apple-darwin.tar.gz"
      sha256 "19005bde9bfffd0a556db9311fcb1758884d0899d48d6dc4d4822015b78de0b9"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc4/subcog-0.6.0-rc4-aarch64-apple-darwin.tar.gz"
      sha256 "91775a8e8111f7631e47df1c6ddceb08e2cb932ba30160d56f64be00d57829c5"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc4/subcog-0.6.0-rc4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6319e48e1094910ccd6fd49344aeb4be96cea80aa2e6438c4e629c29394939c3"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
