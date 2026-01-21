class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.12.0/subcog-0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "7b17cbfca39b6581437dd7f8ec1427727565944ca57cc26b460c815833aeefd8"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.12.0/subcog-0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "49ca4ea02fdacc1869aac739299e35e96a760baa90b0f6dabebb14c36cc3080d"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.12.0/subcog-0.12.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "71dd2bd670b4190040e03f22041d462d8a6a8267d107ac367d7c52e9eb1b0f7d"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
