class Atmux < Formula
  desc "Multi-agent Claude Code orchestration in tmux"
  homepage "https://github.com/juanheyns/agent-tmux"
  url "https://github.com/juanheyns/agent-tmux/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "68327a01cce54b374f913281d09278a09f4281d3ae22abb70b6ca605114e3149"  # Update after creating the release tarball
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
