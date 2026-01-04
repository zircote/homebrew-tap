class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.3.2/subcog-0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "13be015426bd2ca6576711cdea8b806e7bedfb4d3bcea8c05782588ed7020cab"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.3.2/subcog-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "69201ebd79636bfdb47c86147de4dfd2e011495fc19c1cca752a67839d0be922"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.3.2/subcog-0.3.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "69a82ad9ee78f91ec0af85bdd4a9c18803b43c4ae339e461c54133b90e827a3f"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
