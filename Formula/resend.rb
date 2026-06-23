class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/archive/refs/tags/v2.6.0.tar.gz"
      sha256 "e589ccfebcb84b72a176da150314fd55402bc4ec05caf713b031107af3cb5801"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.5.0/resend-darwin-x64.tar.gz"
      sha256 "fa14ec5429ea413cdbdad1d9abf05a8778fd400a0b857ccb488a10477498b39b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.5.0/resend-linux-arm64.tar.gz"
      sha256 "d244c6c654615f3d4ea8422dc87c6ec4753127924d2c12417df844eabec3870b"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.5.0/resend-linux-x64.tar.gz"
      sha256 "64cc4758f5bc0a99db722ac6928e16c2a15ec4d4f34f96aa2a539b4c9a14509c"
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
