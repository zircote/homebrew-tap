class RlmCli < Formula
  desc "Recursive Language Model CLI for Claude Code"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "886fd78c3b7ed87fff8601eb673dd46921ceaa28e53d72fed4e8c84d48754a87"
  version "1.2.4"
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
