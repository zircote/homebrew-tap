class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.7.0/subcog-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "5851e79e022185231dd5e3d3d28af12023a2c27ee8016d23429204e56854a417"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.7.0/subcog-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "2ef7555f78d48a55b4b35ff67d456b434e90eeaf2d67e557a7328af93095742f"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.7.0/subcog-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "373b96db7552e3252593d0316949f53c957c039f9397a8c15b032fe6009ae880"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
