class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/archive/refs/tags/v2.17.0.tar.gz"
      sha256 "e513e7d6bb88f753b84a7478c89ecbf081058abf286017e93ddf4c9b4324211c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.16.0/resend-darwin-x64.tar.gz"
      sha256 "3e8b771fbbd91f55beaf52bbe2926a5c35477c2a64151181393668ca48a4dabf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.16.0/resend-linux-arm64.tar.gz"
      sha256 "2f0fe4896a2bba2fa081cf8ac9c04ecd14cd38385ab5d7eab1dc0538dfe0f52f"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.16.0/resend-linux-x64.tar.gz"
      sha256 "eeee4a549e6dea5116b1877a3fcce826cf9df077ac01e55e14d16420ac18d981"
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
