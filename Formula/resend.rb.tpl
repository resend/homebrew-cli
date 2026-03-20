class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "{{VER}}"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v{{VER}}/resend-darwin-arm64.tar.gz"
      sha256 "{{SHA_DARWIN_ARM64}}"
    else
      url "https://github.com/resend/resend-cli/releases/download/v{{VER}}/resend-darwin-x64.tar.gz"
      sha256 "{{SHA_DARWIN_X64}}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v{{VER}}/resend-linux-arm64.tar.gz"
      sha256 "{{SHA_LINUX_ARM64}}"
    else
      url "https://github.com/resend/resend-cli/releases/download/v{{VER}}/resend-linux-x64.tar.gz"
      sha256 "{{SHA_LINUX_X64}}"
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
