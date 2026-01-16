class Adrscope < Formula
  desc "Validate, visualize, and manage Architecture Decision Records (ADRs)"
  homepage "https://github.com/zircote/adrscope"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "f5d4405a6e507c5ac6c09d775212a8d222b22d6f5c4b98a09ef70b1d4aaadd7c"
    else
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "953db8f2ac33e396e8a5045cd758ddd1584f8d6500caeb5350d5440e3cc216cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8be087c2e1ede3779d3b23263ad59bed8303ec2fd47bcecc7fdd7083b528a245"
    else
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c1a9c02e5ee5cb7e4267d7e039622ecb7aae986bb63520a14b68739b081af68"
    end
  end

  def install
    bin.install "adrscope"
  end

  test do
    system "#{bin}/adrscope", "--version"
  end
end
