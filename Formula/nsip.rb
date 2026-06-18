class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.7.2/nsip-0.7.2-macos-arm64"
      sha256 "4d2b9b2f3d47210bbef9425bc3c9c907623b1013280353b3e56d535463f115d7"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.7.2/nsip-0.7.2-macos-amd64"
      sha256 "205c9ffb9234e1065498da2e19114397ed7a0818814cb08aaccd96b54c046e38"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.7.2/nsip-0.7.2-linux-amd64"
    sha256 "03c8b932ef3e798996fbeff1dd32c516e71413d4d86c428dc40a60d2b8c878ad"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.7.2/nsip-0.7.2-completions.tar.gz"
    sha256 "67c50d6d2478d854fe1f7090b8343dae48c3722f9b3a130627328f51eec21856"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.7.2/nsip-0.7.2-man-pages.tar.gz"
    sha256 "7478ac3681c8580502f50fc0203c9f35212aef3d7aebb7e6fba57edc447b1d43"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "nsip-0.7.2-macos-arm64" => "nsip"
      else
        bin.install "nsip-0.7.2-macos-amd64" => "nsip"
      end
    elsif OS.linux?
      bin.install "nsip-0.7.2-linux-amd64" => "nsip"
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
