class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.14.0/resend-darwin-arm64.tar.gz"
      sha256 "f7592551340aa50b2a26be93d72f201315c3a08944792764b8d9da602ce1dfa9"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.14.0/resend-darwin-x64.tar.gz"
      sha256 "95b4b44aaab6e0f70e1d8f1c8585b3fad7a66dc10c436c686bb8d4e8f5f83373"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.14.0/resend-linux-arm64.tar.gz"
      sha256 "e50f5a1fb7fbea652b449bf749a944fcac9000d88fecb1647074b00a9d0fb397"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.14.0/resend-linux-x64.tar.gz"
      sha256 "159e7cdcde17136dd5d915f36806ae5e20af9f6e495f8d624f56004884c1b2dc"
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
