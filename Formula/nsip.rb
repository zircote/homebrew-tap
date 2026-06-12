class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.6.2/nsip-0.6.2-macos-arm64"
      sha256 "cb1dacc54ce0ab156f2da773734074f94c03df7bc93c35f4e6cd9301ec95b05e"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.6.2/nsip-0.6.2-macos-amd64"
      sha256 "a504388003bdcf379507154863bba414ce78ec936feb7d571407100137bf4770"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.6.2/nsip-0.6.2-linux-amd64"
    sha256 "73cbf86c15b65471935037e5d8c9d6683fc7ca9cf4c9ca74457c5125c050d683"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.6.2/nsip-0.6.2-completions.tar.gz"
    sha256 "e898c02f69df2a3a98102012c3c608048f442845c39250b86480350b6d097b46"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.6.2/nsip-0.6.2-man-pages.tar.gz"
    sha256 "69931b66915d65f66a3b8a3e05b2aaa0a398bbe22da50c60b92d9b7e90434387"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "nsip-0.6.2-macos-arm64" => "nsip"
      else
        bin.install "nsip-0.6.2-macos-amd64" => "nsip"
      end
    elsif OS.linux?
      bin.install "nsip-0.6.2-linux-amd64" => "nsip"
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
