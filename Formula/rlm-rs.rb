class RlmRs < Formula
  desc "Recursive Language Model CLI for Claude Code - handles long-context tasks via chunking"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "11f22fb6ea8c8f57b553c98d78a82db715f37546bc4bc41c9a3efb2a387ab85a"
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
