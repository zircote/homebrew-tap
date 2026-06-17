class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.7.1/nsip-0.7.1-macos-arm64"
      sha256 "6621525d2b6e18b870ac42fa3dae1514639015baeddc6aa71d704bca1fbb9b66"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.7.1/nsip-0.7.1-macos-amd64"
      sha256 "bc33fd4fd713c7ad1b6bdc1f27819188e2f5e532e1019b015e13304378540ac4"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.7.1/nsip-0.7.1-linux-amd64"
    sha256 "e357fb8129590fbaab5879a6e205e1fe4d8f8a963eee6e4925ed6160342d0699"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.7.1/nsip-0.7.1-completions.tar.gz"
    sha256 "12718a920097163ea49942263bf3846df60c42485f004074e8ca82fe4644ae60"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.7.1/nsip-0.7.1-man-pages.tar.gz"
    sha256 "73b89a9eba08d2645c04a9b500a2f5d9a177caaaea096f7d80ab712f04396733"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "nsip-0.7.1-macos-arm64" => "nsip"
      else
        bin.install "nsip-0.7.1-macos-amd64" => "nsip"
      end
    elsif OS.linux?
      bin.install "nsip-0.7.1-linux-amd64" => "nsip"
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
