class RlmRs < Formula
  desc "Recursive Language Model CLI for Claude Code - handles long-context tasks via chunking"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "90b7882e1f8559fb24766103e460ed7a629b1f14957147263602de450d2eaafb"
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
