class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.3.3/nsip-macos-arm64"
      sha256 "c86853048896c2f8b6d2d02600a70f992fc56b96127257d089e3d800ffbe26ca"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.3.3/nsip-macos-amd64"
      sha256 "9f6ee1ac49bd146c1fb6dc68015c48d648dc0b5f050fdc9e7c996732fdee8575"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.3.3/nsip-linux-amd64"
    sha256 "a1da26f66afed62ab279926a695f4033b84c228163534497ede16ebced591e38"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.3.3/nsip-completions.tar.gz"
    sha256 "dd8099bb729dba3045f6627a592412f9dccbeeecc5a813ef4348e27680d0ab4f"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.3.3/nsip-man-pages.tar.gz"
    sha256 "a1c1ff6fb457b01688088be9029d800cbd07dd45a7052c402f32316dd47d01c8"
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
