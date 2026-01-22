class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.14.1/subcog-0.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "a6bc3f555dc73e9ed9168a3850e55374d678f6c539a5ed1b0dcb2beef295a5f0"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.14.1/subcog-0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "502df1837c27c8be53049aa191f2032dc6803581f5c545a291238f1a82750001"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.14.1/subcog-0.14.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "471bd8e5766bcb49abf0682d90e76526a2632594ecdacc132be382d6df70da7f"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
