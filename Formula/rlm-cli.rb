class RlmCli < Formula
  desc "Recursive Language Model CLI for Claude Code"
  homepage "https://github.com/zircote/rlm-rs"
  url "https://github.com/zircote/rlm-rs/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "909d92e88cc8f684a168dd39653e60df26bdc7e7e5cd27f212c03d27d381947b"
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
