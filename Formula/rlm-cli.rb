class RlmCli < Formula
  desc "Recursive Language Model CLI for Claude Code"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "aaa77e238b45c00877a5e2b14b17fdda16e3c7e09b0fe7189707b83fec50a3b3"
  version "1.4.2"
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
