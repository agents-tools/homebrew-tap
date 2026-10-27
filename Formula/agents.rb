class Agents < Formula
  desc "Install and update agent skills and instructions, resolved to exact versions"
  homepage "https://agents-tools.github.io/"
  url "https://github.com/agents-tools/cli/archive/refs/tags/0.2.0.tar.gz"
  sha256 "6ed7f28c1fb7d00d8989de1de4d9a1285200741ad02d687d8d2626267f5e439c"
  license "MIT"
  head "https://github.com/agents-tools/cli.git", branch: "master"

  depends_on xcode: ["26.4", :build]
  depends_on macos: :sequoia

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
