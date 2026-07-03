class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.8.0/resend-darwin-arm64.tar.gz"
      sha256 "08b3aaf91ce561c305830f7e0a8406adee5a3b88b29f87e23949b14845a2cd62"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.8.0/resend-darwin-x64.tar.gz"
      sha256 "1a0f4eedfa5b3cb7c564de5c232a4bba27ce6d844084c8bccaeb44706f5063e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.8.0/resend-linux-arm64.tar.gz"
      sha256 "44f5421c2726ec0f5a52da0fc3471c48c1bb8f70a9df64231ea697bc038e47ae"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.8.0/resend-linux-x64.tar.gz"
      sha256 "2f6787f9beedb72ceab2a206ac02e3d4a5168fab7dde21bd536be255675ee976"
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
