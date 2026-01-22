class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.14.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.14.4/subcog-0.14.4-x86_64-apple-darwin.tar.gz"
      sha256 "a6a129bd3f4942c3fd84ff9ff2679bb6011b48ba9ab4c808d0946470160d133e"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.14.4/subcog-0.14.4-aarch64-apple-darwin.tar.gz"
      sha256 "a516edf5c838912a681b6095037b3cef04233bae1ccec17326788e8d8ade5e53"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.14.4/subcog-0.14.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f157980e242ce841fa782545d55eaff3ae00f841e02674e03b74f522238b582a"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
