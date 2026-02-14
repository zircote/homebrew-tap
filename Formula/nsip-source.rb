class NsipSource < Formula
  desc "Sheep genetic evaluation CLI (source)"
  homepage "https://github.com/zircote/nsip"
  url "https://github.com/zircote/nsip/archive/refs/tags/v0.3.3-rc.3.tar.gz"
  sha256 "0bae0c9c88f20d8c8ad715574416ac46e42da2f0689472159a1f8213ea2349bf"
  version "0.3.3-rc.3"
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
