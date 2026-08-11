class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.12.0/resend-darwin-arm64.tar.gz"
      sha256 "d6f1dab53f1eb6f4d4f1cbd8dd34ffa9e8354c99ea1c29bb1c69abb91d7bb7d7"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.12.0/resend-darwin-x64.tar.gz"
      sha256 "8efef51ffeaf8f0bcd804e0ef909ed2b39c53b7687fc5df5dbb581a1ff565f75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.12.0/resend-linux-arm64.tar.gz"
      sha256 "1394bfd3aac8218f4e3e12df3a7e85438d722150bed40ffdfba1766e9086652b"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.12.0/resend-linux-x64.tar.gz"
      sha256 "b988eadecb364895030fee2eb5596ddf5f50b3a4a6b1c8a53f1f25461d276bde"
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
