class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.28.2/resend-darwin-arm64.tar.gz"
      sha256 "f3902af923de8bd02e6159f7b4eead5c01dbebc14f3225a827ea513fc7e9565c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.28.2/resend-darwin-x64.tar.gz"
      sha256 "6266a11e20b27c6c6c9c2385ea2b4048bf778626d9bac94fd4a886fd941a23d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.28.2/resend-linux-arm64.tar.gz"
      sha256 "51d1fde18c53fa2e07708a92fa83078b83fb6bc5943e6c0b890623446f089bab"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.28.2/resend-linux-x64.tar.gz"
      sha256 "839265945b322214dbca87e56a745b9b58f9d92ac9b69cf2d537691f8a7be735"
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
