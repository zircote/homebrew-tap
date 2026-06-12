class RlmCli < Formula
  desc "Recursive Language Model CLI for Claude Code"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "99b872645075b11b2b39e6eff1653feb00b4f3630f0942291288a1ec79eb49d6"
  version "1.3.0"
  license "MIT"
  head "https://github.com/zircote/rlm-rs.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s,
      shell_output("#{bin}/rlm-cli --version")

    system "#{bin}/rlm-cli", "init"
    assert_predicate testpath/".rlm/rlm-state.db", :exist?
  end
end
