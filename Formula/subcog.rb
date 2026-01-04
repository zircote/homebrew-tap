class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "1b255c5f332911bae89d6439adcdd6ff6699435bd33f64645be3e361562e173f"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d6e3c2376a24895054f3e2e0bbbb8ac4bf75bda2a4f767ad9814294bf0f79b6c"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.4.0/subcog-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0adffe4fab75855a99748a3a3929529d82d3a9b35b829919d164374d47561f67"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
