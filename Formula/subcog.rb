class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.14.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.14.2/subcog-0.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "ef32aca92697cc77cc7ea38841af39041e776632efe66562a8925304290d652d"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.14.2/subcog-0.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "dd9ca2488999708705eccc70f5be7a872d102bb64fc7ae0b6966b52e52f3668e"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.14.2/subcog-0.14.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4e72d8ec28a1c479fb4552cb5d6a94d15e3dd0c85cdc5501111a9591534472e8"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
