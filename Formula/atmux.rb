class Atmux < Formula
  desc "Multi-agent Claude Code orchestration in tmux"
  homepage "https://github.com/juanheyns/agent-tmux"
  url "https://github.com/juanheyns/agent-tmux/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "17ab3e033deaae876b312633df3cd702e22edd030550d23b8f49188dfe15bb34"  # Update after creating the release tarball
  license "MIT"

  depends_on "tmux"
  depends_on "python@3"

  def install
    libexec.install "src", "scripts", "settings", ".tmux.conf", "send", "stop", "atmux"
    chmod 0755, libexec/"atmux"
    chmod 0755, libexec/"send"
    chmod 0755, libexec/"stop"
    (libexec/"scripts/hooks").children.each { |f| chmod 0755, f }

    bin.install_symlink libexec/"atmux"
  end

  test do
    assert_match "Usage: atmux", shell_output("#{bin}/atmux help")
  end
end
