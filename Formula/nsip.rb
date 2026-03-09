class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.4.0-rc1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.4.0-rc1/nsip-macos-arm64"
      sha256 "6b78fd9187138166fb9ae3f9aead49cf3953eb614ce8d112fb413ff42e01206c"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.4.0-rc1/nsip-macos-amd64"
      sha256 "41ec7ea4767599ef7ae3deed2b1567f04dcd42f79401c6d0fef1aa06b03d9d89"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.4.0-rc1/nsip-linux-amd64"
    sha256 "2a015292b0602354f12fadce65892fea36e25657f9d5413c8f7fbad3cba6b3dc"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.4.0-rc1/nsip-completions.tar.gz"
    sha256 "8d771cfcbc9c97e34396f408f5cac46b2ca0b1ee159753326530b16d0f66fe68"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.4.0-rc1/nsip-man-pages.tar.gz"
    sha256 "2d5f6f839244351a3c8117307519c680ecdc07988e76835ce3009ed7a2fa2b23"
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
