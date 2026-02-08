class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.3.2/nsip-macos-arm64"
      sha256 "9bb74cab056fdd9ae7a4ff3a148929d01ce9002987f461adfc4fe748b846c424"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.3.2/nsip-macos-amd64"
      sha256 "5e2eb9ee525c1d4e6f3bafb185c1a4f4821e5a5b0c529f19ffe56339728de553"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.3.2/nsip-linux-amd64"
    sha256 "6f73de1e18f3f1cc4ca7ac8209ec317ccb127ed085f7f834f2c0d0da2d39d2d9"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.3.2/nsip-completions.tar.gz"
    sha256 "1173dcb98a9a649fbec36c2a7106ad08fcb731ead7b31ac2c78dadcb2246a92a"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.3.2/nsip-man-pages.tar.gz"
    sha256 "3a8b1254fbe742f861438511924c00ca276d56d5d9acaaadbaf7277585f358c9"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "nsip-macos-arm64" => "nsip"
      else
        bin.install "nsip-macos-amd64" => "nsip"
      end
    elsif OS.linux?
      bin.install "nsip-linux-amd64" => "nsip"
    end

    resource("completions").stage do
      bash_completion.install "nsip.bash" => "nsip"
      zsh_completion.install "_nsip"
      fish_completion.install "nsip.fish"
    end

    resource("man-pages").stage do
      man1.install Dir["*.1"]
    end
  end

  test do
    assert_match version.to_s,
      shell_output("#{bin}/nsip --version")
  end
end
