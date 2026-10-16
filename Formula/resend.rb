class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.26.0/resend-darwin-arm64.tar.gz"
      sha256 "41e22965c116ca5f921f1f6ad7c503aa9ab32fefd1b6f39ec06d53b7080ff854"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.26.0/resend-darwin-x64.tar.gz"
      sha256 "3f3abd8509d09f1f07329329bcfa562d1cf60e8b57d86e2b51a1333361caf0b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.26.0/resend-linux-arm64.tar.gz"
      sha256 "875447e38a87f9e837d25d13c79a6b7c9cee8f2753ccd5d028772129450f6b13"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.26.0/resend-linux-x64.tar.gz"
      sha256 "c66a8806fa8bcb26a4882cc4cd97a9f848bac47e32ca87aea6a1c7a968ac1730"
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
