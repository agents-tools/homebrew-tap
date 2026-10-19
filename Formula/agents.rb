class Agents < Formula
  desc "Install and update agent skills and instructions, resolved to exact versions"
  homepage "https://agents-tools.github.io/"
  url "https://github.com/agents-tools/cli/archive/refs/tags/0.1.1.tar.gz"
  sha256 "7335af2747d4fede8dde6289b4ce0abde237dd5805899e6f1fe4bfa577751f12"
  license "MIT"
  head "https://github.com/agents-tools/cli.git", branch: "master"

  depends_on xcode: :build
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox", "--product", "agents"
    bin.install ".build/release/agents"
  end

  test do
    assert_equal "agents #{version}", shell_output("#{bin}/agents --version").strip
    assert_match "Manage agent skills and instructions from declared sources.",
                 shell_output("#{bin}/agents --help")
    unknown = shell_output("#{bin}/agents unknown-command --help 2>&1", 64)
    assert_match "Unknown command 'unknown-command'", unknown
  end
end
