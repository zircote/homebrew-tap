class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.4.0/nsip-macos-arm64"
      sha256 "0af5aef02ffaae3a7b9bb4b69d10945e657ba62b40980d683e73acda40f1222b"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.4.0/nsip-macos-amd64"
      sha256 "676cf09843a4eae399c9cc64cc05f7f381e014c16100d85d61e892b3bd7f1bda"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.4.0/nsip-linux-amd64"
    sha256 "ad6d2e2b2d0a8ed5457d02d0e1c82c2e25ba34a42517a5c874d58c69af113607"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.4.0/nsip-completions.tar.gz"
    sha256 "a511e348efa3429c8fd79dc173f78cafaa02120bc3341b02332666cb3ec16e42"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.4.0/nsip-man-pages.tar.gz"
    sha256 "08d9e536486d69053454982cf571cc97695a0385197b8645ed962e442a3a7e45"
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
