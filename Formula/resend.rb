class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.4.0/resend-darwin-arm64.tar.gz"
      sha256 "3c904eb282534bedd135ab03e92a717cae6f43cfcc7ae1394dc183cb0a925228"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.4.0/resend-darwin-x64.tar.gz"
      sha256 "118c8928ce6ebcf8fdc52755c5e1b9c37d8c13dd39ff434aa2da2c9355d737c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.4.0/resend-linux-arm64.tar.gz"
      sha256 "f374f4a0d2c97861db76122d81664b553c78c7e54e21d04432ef6c92cda7bf3f"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.4.0/resend-linux-x64.tar.gz"
      sha256 "dda091f4828361e6db15279b0b3cbdd16b9b5648d7d051c95fa968c4ff17024b"
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
