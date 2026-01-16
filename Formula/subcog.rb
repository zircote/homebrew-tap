class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.1.0"
  license "MIT"

  # Platform-specific binaries will be populated by the release workflow
  # For now, build from source
  url "https://github.com/zircote/subcog.git",
      tag:      "v0.1.0",
      revision: "8b553d0c496616d4e550ffe813f27b4e4cdbe258"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/subcog", "--version"
  end
end
