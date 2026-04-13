class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.9.0/resend-darwin-arm64.tar.gz"
      sha256 "850cb1ee955979293acafbacd3cef45934e59542af4bf5fe3e58abe990301976"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.9.0/resend-darwin-x64.tar.gz"
      sha256 "83ffdc847026b1f046f33930dc3d59f3bb1f963175a75861e6c7abf181f461b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.9.0/resend-linux-arm64.tar.gz"
      sha256 "4b4523f793c5c54c79b9aa5526545dc1d2cb7e796d6f3750c1580cc04e523a90"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.9.0/resend-linux-x64.tar.gz"
      sha256 "55029ae2a2cd568922e52a6357b8f1c2c74d671aa44a933761f1f6fc8f0aa917"
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
