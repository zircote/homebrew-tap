class RlmRs < Formula
  desc "Recursive Language Model CLI for Claude Code - handles long-context tasks via chunking"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "c0be296b45559ab3711c428e6e9138602e4066f00f4306453510191f79febaf9"
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
