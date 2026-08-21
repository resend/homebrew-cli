class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.15.0/resend-darwin-arm64.tar.gz"
      sha256 "7de16e9bf03ef43f3d96c7c76ace07517e0ab465b5f2b0f00e53e54e9e4bb7da"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.15.0/resend-darwin-x64.tar.gz"
      sha256 "590de7208cc654be5e66bf9030f7284b6bf20574659365a46a97b29888a23f30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.15.0/resend-linux-arm64.tar.gz"
      sha256 "555cfb80b87357400573d193cf157480365e3fe0666fadcfb3184d2331c61eff"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.15.0/resend-linux-x64.tar.gz"
      sha256 "2b9a18daf8a027fd46125c0f9a285be46505eca68e5f06671eb57c6e09db611c"
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
