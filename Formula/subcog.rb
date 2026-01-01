class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.1.0/subcog-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "1d90262b863c8c697f5074deff21aef3be8d3cd24ff39a62392c6c0b0f530ec6"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.1.0/subcog-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "dd682050b303ccf859d8cd22fd9f96c3e9c3bd8f4b0c25bbd480aa14848dcf4c"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.1.0/subcog-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "95638c24d4fa9378d2a5831c142d39a0cecde0f2e475ad850140d2303f300aa1"
  end

  def install
    bin.install "subcog"
    (var/"log/subcog").mkpath
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
