class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.2.1/resend-darwin-arm64.tar.gz"
      sha256 "7fa5c2a1b64c49149b0d31b6004f58509621afce5fc5d3203d7d8f178e4c9c95"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.2.1/resend-darwin-x64.tar.gz"
      sha256 "07438cfc0e4515bcc9fe3f37151e839960757e6c219f7ad9bd16c7b7b9b6f204"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.2.1/resend-linux-arm64.tar.gz"
      sha256 "24071469255da883eb7a9332ea95697fd2eae65605b0529bd915b71d2429a779"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.2.1/resend-linux-x64.tar.gz"
      sha256 "4533b94c44b3311433769ebac1c32461238ec9949c62aa45850c6bf527530968"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
