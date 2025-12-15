class GitAdr < Formula
  include Language::Python::Virtualenv

  desc "Architecture Decision Records management using git notes"
  homepage "https://github.com/zircote/git-adr"
  license "MIT"
  url "https://files.pythonhosted.org/packages/fb/cd/2bf761413432e693a9832f97ccc8e98c97332c178f3013388a9f52114605/git_adr-0.1.3.tar.gz"
  sha256 "06b36343168735db5367d75ff11d306ee8392585882c96d2a13314ef0be68f92"

  depends_on "libyaml"
  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "mistune" do
    url "https://files.pythonhosted.org/packages/d7/02/a7fb8b21d4d55ac93cdcde9d3638da5dd0ebdd3a4fed76c7725e10b81cbe/mistune-3.1.4.tar.gz"
    sha256 "b5a7f801d389f724ec702840c11d8fc48f2b33519102fc7ee739e8177b672164"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "python-frontmatter" do
    url "https://files.pythonhosted.org/packages/96/de/910fa208120314a12f9a88ea63e03707261692af782c99283f1a2c8a5e6f/python-frontmatter-1.1.0.tar.gz"
    sha256 "7118d2bd56af9149625745c58c9b51fb67e8d1294a0c76796dafdc72c36e5f6d"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/fb/d2/8920e102050a0de7bfabeb4c4614a49248cf8d5d7a8d01885fbb24dc767a/rich-14.2.0.tar.gz"
    sha256 "73ff50c7c0c1c77c8243079283f4edb376f0f6442433aecb8ce7e6d0b92d1fe4"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e/shellingham-1.5.4.tar.gz"
    sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/8f/28/7c85c8032b91dbe79725b6f17d2fffc595dff06a35c7a30a37bef73a1ab4/typer-0.20.0.tar.gz"
    sha256 "1aaf6494031793e4876fb0bacfa6a912b551cf43c1e63c800df8b1a866720c37"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  def install
    virtualenv_install_with_resources

    # Generate and install shell completions
    generate_completions_from_executable(bin/"git-adr", "completion")
  end

  def caveats
    <<~EOS
      To use git-adr as a git subcommand, add this alias:
        git config --global alias.adr '!git-adr'

      Then you can use: git adr <command>
    EOS
  end

  test do
    system bin/"git-adr", "--version"
  end
end
