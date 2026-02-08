class RlmRs < Formula
  desc "Recursive Language Model CLI for Claude Code"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "dcf2a603d2bea61f54bd2a6db22fe0e0b0e4e35751e04e9683d3c0c8b1812e3a"
  version "1.2.4"
  license "MIT"
  head "https://github.com/zircote/rlm-rs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s,
      shell_output("#{bin}/rlm-rs --version")

    system "#{bin}/rlm-rs", "init"
    assert_predicate testpath/".rlm/rlm-state.db", :exist?
  end
end
