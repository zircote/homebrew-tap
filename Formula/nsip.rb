class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/epicpast/nsip"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicpast/nsip/releases/download/v0.7.4/nsip-0.7.4-macos-arm64"
      sha256 "f531e1032636c3a8eb281e9caff5611ba24364ecc45dee82531ae5eedfac4c6f"
    else
      url "https://github.com/epicpast/nsip/releases/download/v0.7.4/nsip-0.7.4-macos-amd64"
      sha256 "6764c09142a98158c73f3b81e9cd95b82de2f031a2610c9cc0ff5a4f38f39eee"
    end
  end

  on_linux do
    url "https://github.com/epicpast/nsip/releases/download/v0.7.4/nsip-0.7.4-linux-amd64"
    sha256 "bb17dc6c6e322cfb47d7ea1ce1d0eb59f9d1955decdef85115b4565ba4636f85"
  end

  resource "completions" do
    url "https://github.com/epicpast/nsip/releases/download/v0.7.4/nsip-0.7.4-completions.tar.gz"
    sha256 "3ed505054643322142438186f8644eb185ccb692e732c30495bf267e499f9884"
  end

  resource "man-pages" do
    url "https://github.com/epicpast/nsip/releases/download/v0.7.4/nsip-0.7.4-man-pages.tar.gz"
    sha256 "bec234e9413ee2b8f792d19277529d246bd4ab56335142ce0ed2388dc083cb44"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "nsip-0.7.4-macos-arm64" => "nsip"
      else
        bin.install "nsip-0.7.4-macos-amd64" => "nsip"
      end
    elsif OS.linux?
      bin.install "nsip-0.7.4-linux-amd64" => "nsip"
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
