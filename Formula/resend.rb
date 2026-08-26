class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.17.1/resend-darwin-arm64.tar.gz"
      sha256 "00b42078b3cdd804930f756642cb2147910a221868ebb86c7abd6cc5575db298"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.17.1/resend-darwin-x64.tar.gz"
      sha256 "750773d682e0e1bb069fea4d08cf1d537d567adc9746749d917726c7fc8c638e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.17.1/resend-linux-arm64.tar.gz"
      sha256 "808dda5bf626ea82e2032b2886abb4119028cac728b5a5b6a8e7367807137918"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.17.1/resend-linux-x64.tar.gz"
      sha256 "8083f8b2a2d816cf4bee8cbde07f374c3cb741ef9f2b0a0afcd54e8209a867d4"
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
