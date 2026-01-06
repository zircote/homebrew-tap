class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.0-rc4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc4/subcog-0.6.0-rc4-x86_64-apple-darwin.tar.gz"
      sha256 "09584895c80123c87bea2d7808d99cb575f59ad79df8caf1792b2a49b2bb5eb5"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc4/subcog-0.6.0-rc4-aarch64-apple-darwin.tar.gz"
      sha256 "0d9b95814679a0d44e2349a5453125fb849ba5152843abd5ea774d46d0129c2f"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc4/subcog-0.6.0-rc4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bb396d950ba6e85f0021791a6580ea966929dff3980028ef8803783f93a88c17"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
