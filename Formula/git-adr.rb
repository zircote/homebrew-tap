class GitAdr < Formula
  include Language::Python::Virtualenv

  desc "Manage Architecture Decision Records using git notes"
  homepage "https://github.com/zircote/git-adr"
  url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
  sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  license "MIT"
  head "https://github.com/zircote/git-adr.git", branch: "main"

  depends_on "libyaml"
  depends_on "python@3.12"

  resource "typer" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  resource "python-frontmatter" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  resource "mistune" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  # Transitive dependencies for typer
  resource "click" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  # Transitive dependencies for rich
  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/d3/9d/37867353a8a6e54027aa4d903e190c3e5641fb6bfd49d702dfe3c529e3d9/git_adr-0.1.1.tar.gz"
    sha256 "eb1a11b95d512652ca0d463946d1bf2dda5774a0608216549a252d8b4bf7ec5b"
  end

  def install
    virtualenv_install_with_resources

    # Generate and install shell completions
    generate_completions_from_executable(bin/"git-adr", "completion", shells: [:bash, :zsh, :fish])

    # Install man pages if they exist in the distribution
    man1.install Dir["share/man/man1/*.1"] if Dir.exist?("share/man/man1")
  end

  def caveats
    <<~EOS
      To use git-adr as a git subcommand, add a git alias:

        git config --global alias.adr '!git-adr'

      Then you can use: git adr new "My Decision"

      For shell completion, you may need to restart your shell or run:
        source #{bash_completion}/git-adr (bash)
        source #{zsh_completion}/_git-adr (zsh)
    EOS
  end

  test do
    assert_match "git-adr", shell_output("#{bin}/git-adr --version")
    assert_match "Usage:", shell_output("#{bin}/git-adr --help")

    # Test basic command structure
    system bin/"git-adr", "--help"
  end
end
