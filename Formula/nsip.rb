class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zircote/nsip/releases/download/v0.7.0/nsip-0.7.0-macos-arm64"
      sha256 "6c0402659886b1e81c065fa09d326045e8616681f6a0b9285cddfe3933ca5087"
    else
      url "https://github.com/zircote/nsip/releases/download/v0.7.0/nsip-0.7.0-macos-amd64"
      sha256 "af01b94410df5c3f082384909b750f4815c6e52f8b350d9a92e7d54c898d0fa6"
    end
  end

  on_linux do
    url "https://github.com/zircote/nsip/releases/download/v0.7.0/nsip-0.7.0-linux-amd64"
    sha256 "6d5bb32ef69b6719b1878ed02ffb5f3e905e4bc070c799aa6cd7758a407af86b"
  end

  resource "completions" do
    url "https://github.com/zircote/nsip/releases/download/v0.7.0/nsip-0.7.0-completions.tar.gz"
    sha256 "dae1963267a8d0b8403ebab01c4c3ff68f2f89fbefb2d6535b0dfb371922a1b8"
  end

  resource "man-pages" do
    url "https://github.com/zircote/nsip/releases/download/v0.7.0/nsip-0.7.0-man-pages.tar.gz"
    sha256 "df9797674968fb4e2c5ca63d712eb0f8139bf3339dd1eb2b98daa4675be9fd5b"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "nsip-0.7.0-macos-arm64" => "nsip"
      else
        bin.install "nsip-0.7.0-macos-amd64" => "nsip"
      end
    elsif OS.linux?
      bin.install "nsip-0.7.0-linux-amd64" => "nsip"
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
