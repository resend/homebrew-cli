class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.26.2/resend-darwin-arm64.tar.gz"
      sha256 "b1c83bf23482d7e1e17b81998f849481d124501a8add32e441fce0cdcb9957c1"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.26.2/resend-darwin-x64.tar.gz"
      sha256 "3b4d10f162b955fd3a7dec98e3668a5773a05fca5536a79eebbbcee06b6ac2b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.26.2/resend-linux-arm64.tar.gz"
      sha256 "29913cea3415f361e25559135a04e579c306463c0dda1a60505db0ceefd8bb25"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.26.2/resend-linux-x64.tar.gz"
      sha256 "556208c22a9783bbca925ad9e59745ae2712bb495950c8ba71c590066d35002b"
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
