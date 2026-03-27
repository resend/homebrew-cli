class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.7.1/resend-darwin-arm64.tar.gz"
      sha256 "d7f31090a1dc8d85a93fc7e4227c8935119a54669bb94bf786166e55093a0696"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.7.1/resend-darwin-x64.tar.gz"
      sha256 "fbabd772475709ae7a9b6866c6fa52998d6d0c219cf8be659c2ef0b62344250c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.7.1/resend-linux-arm64.tar.gz"
      sha256 "10775552fca3491ae38bfc98f9447e4d43482defff1e6486f333fcd06c57325f"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.7.1/resend-linux-x64.tar.gz"
      sha256 "b7a698e234b2d9cc5fc1e36f7941f44aafbd12dfcf8819b8e8aeb2059cc2c45a"
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
