class Agents < Formula
  desc "Install and update agent skills and instructions, resolved to exact versions"
  homepage "https://agents-tools.github.io/"
  url "https://github.com/agents-tools/cli/archive/refs/tags/0.1.0.tar.gz"
  sha256 "ac9bc571cc1a7b8e4138e5da1d9ecb9f6f6dfcd5f846d3d9826a12aad4e72f73"
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
