class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.3.1/resend-darwin-arm64.tar.gz"
      sha256 "323e467318f34ff0e12c65e0c04ac3832537e8a80b2f316ebb5451cfa55bc15d"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.3.1/resend-darwin-x64.tar.gz"
      sha256 "1124524dca6b2062474abd9113ff6a8d7f95a85b35f03fa199cfd47694f0c283"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.3.1/resend-linux-arm64.tar.gz"
      sha256 "1a5cbee63f216582852cf94df34297de0421c30a80774730d3b2ba492703dbb2"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.3.1/resend-linux-x64.tar.gz"
      sha256 "f71e745c0130eb6f7b1ff7fe1c80feea8ab095bbc42ef5c9cd9d29697160ecaa"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
