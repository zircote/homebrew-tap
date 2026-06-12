class NsipSource < Formula
  desc "Sheep genetic evaluation CLI (source)"
  homepage "https://github.com/zircote/nsip"
  url "https://github.com/zircote/nsip/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "66361d1c4ebcc80d039f4693760bc4f06b76b8762cba59fa3aadd242ef6f4c15"
  version "0.6.2"
  license "MIT"
  head "https://github.com/zircote/nsip.git", branch: "develop"

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
