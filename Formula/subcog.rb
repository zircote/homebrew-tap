class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.0-rc2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc2/subcog-0.6.0-rc2-x86_64-apple-darwin.tar.gz"
      sha256 "5e98da7cb9bb9580b8a53d8ff7eef8211675cdb74a9fd4298cdf17b4dc2f387e"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc2/subcog-0.6.0-rc2-aarch64-apple-darwin.tar.gz"
      sha256 "00407935b7ede4f671af376c88ffe26b5edff85b8ef235200460938cbdbc543b"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc2/subcog-0.6.0-rc2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c3ba6c6ebeb51116319ef3d48ddff806d34e60f651d49b0eab77c308b3a324a8"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
