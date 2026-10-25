class Agents < Formula
  desc "Install and update agent skills and instructions, resolved to exact versions"
  homepage "https://agents-tools.github.io/"
  url "https://github.com/agents-tools/cli/archive/refs/tags/0.1.2.tar.gz"
  sha256 "72e5c7704d2d8358b8d138683c5f9a64593b1c2faa979911faaf65dbc2bf1c66"
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
