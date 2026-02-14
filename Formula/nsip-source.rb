class NsipSource < Formula
  desc "Sheep genetic evaluation CLI (source)"
  homepage "https://github.com/zircote/nsip"
  url "https://github.com/zircote/nsip/archive/refs/tags/v0.3.3-rc.2.tar.gz"
  sha256 "33df00c31feab13887cd21c1c4afa16a9bb6386eae307901b6b9980e1f8de431"
  version "0.3.3-rc.2"
  license "MIT"

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
