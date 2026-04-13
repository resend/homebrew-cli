class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.9.1/resend-darwin-arm64.tar.gz"
      sha256 "c3b5144c86ebaf3e39bb24d143ad139f97709c54d6df6299241a6a34c9eb3788"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.9.1/resend-darwin-x64.tar.gz"
      sha256 "4203772953f3b61d15293a0e1296cf594fbfc6b5cabcf884581bcef3905325ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.9.1/resend-linux-arm64.tar.gz"
      sha256 "a5df50a09777b65b9e10f865bd9c3e00e9a0a3cf8ee7fa48ac512c3dc3885ca8"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.9.1/resend-linux-x64.tar.gz"
      sha256 "3673bf6c8160d134374db6a39220a6305fd608481964ba177905f07cd634e4b9"
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
