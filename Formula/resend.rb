class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.1.0/resend-darwin-arm64.tar.gz"
      sha256 "c7ef1917578d8744695ab221e280b067aec2c94cf823a568ca8fced951a4b302"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.1.0/resend-darwin-x64.tar.gz"
      sha256 "441fb35f0eebfe82589b7f9e10f217be128266637b70a5f6de434b84a376648a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.1.0/resend-linux-arm64.tar.gz"
      sha256 "eab893b658e54739f153dafb9d7656f9384819654872674aa6f8e144142f8cc7"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.1.0/resend-linux-x64.tar.gz"
      sha256 "bdd131353893f8a17dc5d19d980ada410337708be89fa832652e2aa2c1cecdde"
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
