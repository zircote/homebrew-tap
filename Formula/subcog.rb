class Subcog < Formula
  desc "A persistent memory system for AI coding assistants"
  homepage "https://github.com/zircote/subcog"
  version "0.6.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc.1/subcog-0.6.0-rc.1-x86_64-apple-darwin.tar.gz"
      sha256 "302f2b855e85a23e8570fd8fcba08c5d613ebc3bbb3be922ac2a2c56298c8fa8"
    else
      url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc.1/subcog-0.6.0-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "f0aebda4890cf126c9ec9c9fd37cad4e61daaaf4070128c6e1f291e266b81249"
    end
  end

  on_linux do
    url "https://github.com/zircote/subcog/releases/download/v0.6.0-rc.1/subcog-0.6.0-rc.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3728b663d92b4d12da4860085e9ffae8696dd1e26439e8d7e32a3cf355f973c"
  end

  def install
    bin.install "subcog"
  end

  test do
    system "\#{bin}/subcog", "--version"
  end
end
