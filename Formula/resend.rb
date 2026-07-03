class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.7.0/resend-darwin-arm64.tar.gz"
      sha256 "d277b5c4d75d9f094e866b4ada0dbf61908a7203ebcf1fc3a31433ad7a674788"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.7.0/resend-darwin-x64.tar.gz"
      sha256 "ab81b88a6987489fcfd24c3bfb943ebe425c2f23b1dadf2b8120477d78ed86d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.7.0/resend-linux-arm64.tar.gz"
      sha256 "d970efa118eff768e9ec127870a61617a7ebdb32079af00140ecfb3597785fb5"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.7.0/resend-linux-x64.tar.gz"
      sha256 "830a30fd807c52569291734cce747717eba616891b4e586cada05f6115b5b5f4"
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
