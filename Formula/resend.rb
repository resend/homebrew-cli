class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/homebrew-cli/releases/download/v1.1.0/resend-darwin-arm64.tar.gz"
      sha256 "20f750c2f9eed8f3a1f907588387cfcf05ccacd4136408d52f6e3c0f22d3d642"
    else
      url "https://github.com/resend/homebrew-cli/releases/download/v1.1.0/resend-darwin-x64.tar.gz"
      sha256 "0da5582fdb1ffffb39c7f7176d3ff5151921373e022ca1e7ca243e07f4adb596"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/homebrew-cli/releases/download/v1.1.0/resend-linux-arm64.tar.gz"
      sha256 "1285e3204474a8d5ded096f5128a71e907c983531b2a003b8de9efe3a64295df"
    else
      url "https://github.com/resend/homebrew-cli/releases/download/v1.1.0/resend-linux-x64.tar.gz"
      sha256 "e76ea8ed869ef82f3dfef1d1f08c1dee421640b66b8e61815c6cd17bc512616e"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
