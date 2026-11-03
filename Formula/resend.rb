class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.27.0/resend-darwin-arm64.tar.gz"
      sha256 "03bfbb2ea236c031f9f05bb9ee84cae6f99b25aa9317ad60a382a1ca3ad6b5e0"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.27.0/resend-darwin-x64.tar.gz"
      sha256 "d846ba8c8a9857ca7c7c241d135bfd452108f8ff7ff7ef68dbbc44f652ad3da9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.27.0/resend-linux-arm64.tar.gz"
      sha256 "b29f389c3b04bb824bdb1c1bc40de1817aa2e33ae1b3a9478790cee7158cb62c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.27.0/resend-linux-x64.tar.gz"
      sha256 "3740c1d5f1da58e575a5f87fe35fd49545912fcbd3367986e88e0342ca3322c1"
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
