class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.4.1/resend-darwin-arm64.tar.gz"
      sha256 "191421b9a9599a177c4ca3cba6e63876f8c7138de97d3ac55959c8684bd64d2c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.4.1/resend-darwin-x64.tar.gz"
      sha256 "2878bd615aab2e04b71f9e3f23d6b0fdf84885529deba182f8a15e9455404fe7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.4.1/resend-linux-arm64.tar.gz"
      sha256 "38348d24dadafbd8401462f9aa94a78be9e98ebd9e60c45c4d906463b7234520"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.4.1/resend-linux-x64.tar.gz"
      sha256 "4f60d695718ebc8fbcca93bf60c6e7eb0601512d5c42c0ed764371044704b488"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
