class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.17.0/resend-darwin-arm64.tar.gz"
      sha256 "caac871144266aba88c28f47917566520db1b3be610ad5c82701b62bef3e0ce1"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.17.0/resend-darwin-x64.tar.gz"
      sha256 "c5eab4fbddbf20c4b132a9aec002d3ef81701ba4b5cfb56bd82c86681eccaf76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.17.0/resend-linux-arm64.tar.gz"
      sha256 "9cc41d22d9c49a5ca92f0bfda8f487b0e751c84d8d1f1b2639320b5be3f1c6ac"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.17.0/resend-linux-x64.tar.gz"
      sha256 "864f9cbe4b35f8c72e4960572936fe02a5408f4a5a7a17dfea52dbc224978515"
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
