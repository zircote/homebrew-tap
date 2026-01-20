class RlmRs < Formula
  desc "Recursive Language Model CLI for Claude Code - handles long-context tasks via chunking"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b9211bee5015b3d0fe47958ca7fc14b48052e6fcd7f8badff6b2756691ef5903"
  license "MIT"
  head "https://github.com/zircote/rlm-rs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "rlm-rs #{version}", shell_output("#{bin}/rlm-rs --version")

    # Test init command
    system "#{bin}/rlm-rs", "init"
    assert_predicate testpath/".rlm/rlm-state.db", :exist?
  end
end
