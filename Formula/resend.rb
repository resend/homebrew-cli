class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.24.0/resend-darwin-arm64.tar.gz"
      sha256 "0870c46c09d73e94f8454ba4d4ca0e2333b85e53ed9781406315c85f82c3b07e"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.24.0/resend-darwin-x64.tar.gz"
      sha256 "e262233918cebd2ac3579f414981f2efa53b9d8884e1740c0f67a282bbf008a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.24.0/resend-linux-arm64.tar.gz"
      sha256 "8b842045fa1193c30968e95f2cbdd1db9e9b70627f1b17a25b7d5ccf1f6e319e"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.24.0/resend-linux-x64.tar.gz"
      sha256 "fe292d21e84884ae9873ee08a021a485750c7004d732f88fd8cb41da6e1c8ffb"
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
