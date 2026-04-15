class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.0.0/resend-darwin-arm64.tar.gz"
      sha256 "5f99047c4e070db9fa820713e634cfcd234b8b14d36654d9d65757d47350592a"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.0.0/resend-darwin-x64.tar.gz"
      sha256 "b300923471d0f761c31ced21fad49b7455af9692219ad3e25fd9ec3d04d85c56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.0.0/resend-linux-arm64.tar.gz"
      sha256 "375b27db8d8a0928c77efe0c72a9e7e637819ea51e56f197c5cd4f2c39e04174"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.0.0/resend-linux-x64.tar.gz"
      sha256 "7361274372ad88ea97ef21b2e0e57601ca0db3df1d9fff19a13bcf778a21ad83"
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
