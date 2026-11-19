class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.29.0/resend-darwin-arm64.tar.gz"
      sha256 "cce554fc78eb7bb183efe1d6f46b5658b0a4526f1924208be86a0008314fac59"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.29.0/resend-darwin-x64.tar.gz"
      sha256 "824de5f5349b74171dd16e22ba3b01d74be7dee01be2c4b9d609bfe8adb00bd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.29.0/resend-linux-arm64.tar.gz"
      sha256 "e743b8e85630b0b189777197787617524c38ab1b8bb3e6be6a49b1d6784759c2"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.29.0/resend-linux-x64.tar.gz"
      sha256 "9db20ae279a8ed9200b7a24c39e0491b9c6d878abbf64212546af26fc7423f00"
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
