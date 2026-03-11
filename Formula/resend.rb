class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.2.2/resend-darwin-arm64.tar.gz"
      sha256 "0121dadcd6f39621ec1ac54dcca249073f6b79ef1c7cad75efb6fd65c52d6178"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.2.2/resend-darwin-x64.tar.gz"
      sha256 "e9ea9e51cb672741ae7ff39a6baa8f37c522b03d7e02720bae98bcaad3ad6e8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.2.2/resend-linux-arm64.tar.gz"
      sha256 "a11d9cae316fda424e9d9949c930cf8e36411bb6b3e6b0bb1ac0aa1dc10f87fb"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.2.2/resend-linux-x64.tar.gz"
      sha256 "865d084181e8775445d60d0a30211c1002a3ecb8d82d948809b5c3abf476d9c5"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
