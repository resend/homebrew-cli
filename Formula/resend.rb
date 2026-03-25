class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.7.0/resend-darwin-arm64.tar.gz"
      sha256 "0f2c8765a85c5f88a324bd18eda2d3a3dd749d2c129d74f92e78f96fa1ff54c1"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.7.0/resend-darwin-x64.tar.gz"
      sha256 "b31dc26d9bb16b513e2044a350ea43f31eeccfe4fc00b8aa13fcaa783fd14d22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.7.0/resend-linux-arm64.tar.gz"
      sha256 "20d5edc2708c8e7e12182532ff0e6a49741f682ab61603fa976eebf1a38a3473"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.7.0/resend-linux-x64.tar.gz"
      sha256 "50408afa257113d8526ca3b89fb73a426c7de857ccc0729e50fbe110338e6e49"
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
