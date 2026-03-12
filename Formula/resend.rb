class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.3.0/resend-darwin-arm64.tar.gz"
      sha256 "b23ea115506cc5e649c202a959005079ae0de91ce6727facb64f89ff0ebf1c57"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.3.0/resend-darwin-x64.tar.gz"
      sha256 "1fa5277b1addb9f458db4c543eead415286655105c651c59d31bf2f5c46215ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.3.0/resend-linux-arm64.tar.gz"
      sha256 ""
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.3.0/resend-linux-x64.tar.gz"
      sha256 "36a54ee4975a08043ea8bd98862df3297650c4edeffde1cf87fe75e3964b9d50"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
