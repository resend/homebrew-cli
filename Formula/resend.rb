class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/homebrew-cli/releases/download/v#{version}/resend-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/resend/homebrew-cli/releases/download/v#{version}/resend-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/homebrew-cli/releases/download/v#{version}/resend-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/resend/homebrew-cli/releases/download/v#{version}/resend-linux-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
