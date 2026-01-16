class Adrscope < Formula
  desc "Validate, visualize, and manage Architecture Decision Records (ADRs)"
  homepage "https://github.com/zircote/adrscope"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "cc9fbb4cae4dc2e009b57bdc5b78d2c21f20b9cdf3acc08a64ea09e79d9c16f3"
    else
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "524f4348dedf82e9e8eaaab35fb1ec4ab110f6d0ee4212dd5ee6c652c4f82187"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34596678b8a08c453df010f877653aa643ff80516f951b51af696fdd6f3502f4"
    else
      url "https://github.com/zircote/adrscope/releases/download/v0.3.0/adrscope-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b5cd337ed5f04aeb6e2410ad24afa4b9f5fe0fd62e1e7c3c550d5d38436d11d"
    end
  end

  def install
    bin.install "adrscope"
  end

  test do
    system "#{bin}/adrscope", "--version"
  end
end
