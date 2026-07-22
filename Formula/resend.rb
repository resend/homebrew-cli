class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.10.0/resend-darwin-arm64.tar.gz"
      sha256 "76964cb2048972e0e3c47740e6c49182fda6d3f3f683687fa15384b22d5d9972"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.10.0/resend-darwin-x64.tar.gz"
      sha256 "3bca4301b18010242830d63e6792b6705be8be6eb7d724241ac06ce5cbea83f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.10.0/resend-linux-arm64.tar.gz"
      sha256 "47364cdf893577a35f27fbc2ff6556a6f17d96b62ff41950eb337b0facaa73f6"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.10.0/resend-linux-x64.tar.gz"
      sha256 "52a37c77419e37b60b7ee62e3cf73899a26efb1d107ba3b2274af3b3088748f1"
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
