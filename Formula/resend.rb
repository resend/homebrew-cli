class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.6.0/resend-darwin-arm64.tar.gz"
      sha256 "408d2492499b98015c0c8ddbf08a95bd58ecb6b5f95a51be410c4ddabcd66a7b"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.6.0/resend-darwin-x64.tar.gz"
      sha256 "4d9256230e4238e2d005f5888204f8c1b80c3db9ccc8aaa7cbd09e1692465a3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.6.0/resend-linux-arm64.tar.gz"
      sha256 "1d456503d31cee5050b491d9d8b0fe707caeba0a037247547c0d283c341fb8fd"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.6.0/resend-linux-x64.tar.gz"
      sha256 "c38464fc2c50fdbc099852edd81da71eeabe39cb54888714f1a04f25bcf7c88c"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
