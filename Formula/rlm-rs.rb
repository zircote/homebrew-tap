class RlmRs < Formula
  desc "Recursive Language Model CLI for Claude Code"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "a916214d3e81de19b04bcf569d1568f31b78c097f20fe953881daac784b0fb6c"
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
