class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.2.1/resend-darwin-arm64.tar.gz"
      sha256 "628e7432339131e6663512fdb6db77a8d63a6f266bf46f178f6893f795cf0aed"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.2.1/resend-darwin-x64.tar.gz"
      sha256 "0892a2198436560f5d866a8421d65add2917e507b1ddb2835a5f24419bc78a0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.2.1/resend-linux-arm64.tar.gz"
      sha256 "0cdba5018fec309d58e3b4c7ca667cf2d19e588fc4c99a864548c2a0a74a97b8"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.2.1/resend-linux-x64.tar.gz"
      sha256 "ac9581fe3607701bc9fde6e562933def46285db20f20c8e3a6b903cac90b701d"
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
