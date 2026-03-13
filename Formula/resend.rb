class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.4.0/resend-darwin-arm64.tar.gz"
      sha256 "22d764a1d9f9f85787d5a80c2a71790e9bfe993145344b3f3fb69b8870bc24ff"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.4.0/resend-darwin-x64.tar.gz"
      sha256 "99d9408982a07268849bd48f1ad7fd83935f8bc72dfd3223cfed5874b47549b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.4.0/resend-linux-arm64.tar.gz"
      sha256 "476f95ca990adb0c79a1400170d1817870e497b4ebf6c9a47a6553eba79f5d6f"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.4.0/resend-linux-x64.tar.gz"
      sha256 "8527e9e7380a586db59e7854adeb12c5c27b84506cbe4d57856663b87ff5d9cb"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
