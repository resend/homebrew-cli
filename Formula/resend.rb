class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.8.1/resend-darwin-arm64.tar.gz"
      sha256 "62601ba51ea26fd411e0b1997954232ad4a01fa2d3a00657cf57477e91121073"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.8.1/resend-darwin-x64.tar.gz"
      sha256 "29e9633cc9b757bc814aa61909ed410829174c7b9507ba7cae9fe8fd70086419"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.8.1/resend-linux-arm64.tar.gz"
      sha256 "6583bec18e938a9c26eee79769d387950cbb6829f6035ca79ab2a9f057a3f269"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.8.1/resend-linux-x64.tar.gz"
      sha256 "cd7ebe7adadaca855b8da395a7f7d506ffac46d85417f77123220db21a151bb0"
    end
  end

  def install
    bin.install "resend"

    generate_completions_from_executable(bin/"resend", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
