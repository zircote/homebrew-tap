class NsipSource < Formula
  desc "Sheep genetic evaluation CLI (source)"
  homepage "https://github.com/epicpast/nsip"
  url "https://github.com/epicpast/nsip/archive/refs/tags/v0.7.4.tar.gz"
  sha256 "3d3d0d6b8db57138ee7103648cb7c3436a0922b7d3924d5b405ec30a5c83a3e8"
  version "0.7.4"
  license "MIT"
  head "https://github.com/epicpast/nsip.git", branch: "develop"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # Generate completions
    out = Utils.safe_popen_read(
      bin/"nsip", "completions", "bash"
    )
    (bash_completion/"nsip").write out

    out = Utils.safe_popen_read(
      bin/"nsip", "completions", "zsh"
    )
    (zsh_completion/"_nsip").write out

    out = Utils.safe_popen_read(
      bin/"nsip", "completions", "fish"
    )
    (fish_completion/"nsip.fish").write out

    # Generate man pages
    system bin/"nsip", "man-pages",
      "--out-dir", man1
  end

  test do
    assert_match version.to_s,
      shell_output("#{bin}/nsip --version")
  end
end
