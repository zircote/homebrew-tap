class RlmCli < Formula
  desc "Recursive Language Model CLI for Claude Code"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "7cebba540e816cb97a98c7ed1fe9d6da0034badb405de9fb990b2df5aaf3c321"
  version "1.3.1"
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
