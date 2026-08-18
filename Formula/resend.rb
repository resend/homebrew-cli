class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.13.0/resend-darwin-arm64.tar.gz"
      sha256 "be4dbf2ef997f1e27ac245d3f1defd330e0b9ed6741c85b8295237669a2ba271"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.13.0/resend-darwin-x64.tar.gz"
      sha256 "e0bde81a31930d7eefade185808fb3c352115d03be6bc167846c896631387b19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.13.0/resend-linux-arm64.tar.gz"
      sha256 "7e75e8fc417a37102a4c3e010a8895e43a6b4187e84b1ea9ebfa13fa8afebebd"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.13.0/resend-linux-x64.tar.gz"
      sha256 "b0d09b65425d912f2c21ff1b09e902c7d6b45e0dfb63f05ce620b26e5c34a818"
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
