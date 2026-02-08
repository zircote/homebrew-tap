class Nsip < Formula
  desc "Sheep genetic evaluation CLI"
  homepage "https://github.com/zircote/nsip"
  url "https://github.com/zircote/nsip/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "5bd472e2e55bcdbb3abba19a9e58ecb074d832ad53bed0db2258a840aa5d8242"
  license "MIT"
  version "0.3.2"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s,
      shell_output("#{bin}/nsip --version")
  end
end
