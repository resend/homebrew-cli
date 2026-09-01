class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.18.0/resend-darwin-arm64.tar.gz"
      sha256 "650876a918d60576e9b4411bf4d963df45142ca49b3dd0244475e180e3c31298"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.18.0/resend-darwin-x64.tar.gz"
      sha256 "b45c3637e9cff36a749ac79a2b5c9ef4e1b7e8938abb36dcb245801b4b2024c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.18.0/resend-linux-arm64.tar.gz"
      sha256 "93bdd4482d81502e093f39b13ce34fa51fc0dbefcc630f437aed50a5d17960a9"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.18.0/resend-linux-x64.tar.gz"
      sha256 "5d24e4080de7c427a82c8954172e12bfdbb374cdac5066c31b5f00e6ecfcd230"
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
