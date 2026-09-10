class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.20.0/resend-darwin-arm64.tar.gz"
      sha256 "a242b57563f8bc21253db011a3e2843f82456ab89e1089f21a9e1373cbd67e5c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.20.0/resend-darwin-x64.tar.gz"
      sha256 "245b066d2dc3da3a555f336a7652c8056d9cd7b371b0562a1c337ab691ff6de5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.20.0/resend-linux-arm64.tar.gz"
      sha256 "6dd28ae2d4ecff50bee7e21931f468ffb4e3a94c07258119ab287b65432db76a"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.20.0/resend-linux-x64.tar.gz"
      sha256 "2c87392dbc2294d06cad539d24ea72f25d51b46b34b4266c285b6a99a563c781"
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
