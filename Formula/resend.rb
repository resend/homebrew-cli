class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.5.1/resend-darwin-arm64.tar.gz"
      sha256 "bd22a1b8843b06ddadec457712448cebe0168106a1a4eca2bfc44a0bab1057f5"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.5.1/resend-darwin-x64.tar.gz"
      sha256 "f56b1e47d7dc499d2fdb8ae568f65efeaf8bfca2f5a8b828f8779392bf629690"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.5.1/resend-linux-arm64.tar.gz"
      sha256 "92f8942ebe99f936f3cde068dbf58d9b1df46b706c874a683c1b4f2c46b40aa6"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.5.1/resend-linux-x64.tar.gz"
      sha256 "f1d8bc7634ca2564f2943f8f9565050e2e090cf2fc9b89f8a90d2ef239dfa8d3"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
