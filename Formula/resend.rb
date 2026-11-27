class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.30.1/resend-darwin-arm64.tar.gz"
      sha256 "3ec2aeb776089f2afcea396106391cdb69e990d0b4724dfd999c9bc240f76602"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.30.1/resend-darwin-x64.tar.gz"
      sha256 "67ac6f5885f879b5bde3a140e5bb94731957d60fe8a3b0638aa4c2f58bec9430"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.30.1/resend-linux-arm64.tar.gz"
      sha256 "3e42ee1d78c94e81739f94054b5d82830015a263d467cfb0c920f241450dbfb3"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.30.1/resend-linux-x64.tar.gz"
      sha256 "19e0b998ea60aaf48de8f198dd4a0743ac6dbb18965e4d138c0183e7953fdf94"
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
