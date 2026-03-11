class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/homebrew-cli/releases/download/v0.8.0/resend-darwin-arm64.tar.gz"
      sha256 "e8ba09e9506b600769b388d68dc5e25a254d5331b49f02c047dde957c8318f83"
    else
      url "https://github.com/resend/homebrew-cli/releases/download/v0.8.0/resend-darwin-x64.tar.gz"
      sha256 "38d0b723b1be052a6dc57b56da40db297705d15ebcf4dbdf618b34e60ed2aa34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/homebrew-cli/releases/download/v0.8.0/resend-linux-arm64.tar.gz"
      sha256 "202e8a8716d8f7062c367d44d00d93ec21c517921ca9932394b2bc21fcf6f3ab"
    else
      url "https://github.com/resend/homebrew-cli/releases/download/v0.8.0/resend-linux-x64.tar.gz"
      sha256 "a2663c95796c8bf4d7bb7f35a2fd6a02ff7422e7a809d7a19f98dcb94fbfd91d"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version")
  end
end
