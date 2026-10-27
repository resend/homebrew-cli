class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.26.1/resend-darwin-arm64.tar.gz"
      sha256 "c32f10acfcf014f3cc66457b4b4494020742578ab8a03ff436e51beedcb4b8ec"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.26.1/resend-darwin-x64.tar.gz"
      sha256 "81e8d1c47c9ead282eb39e2cd4cf7be2b84646a07ad49cff8410031232e77b9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.26.1/resend-linux-arm64.tar.gz"
      sha256 "e954f3f3d7a04b63bfd59b0c2c57666af495e3f77866435f28a2e86bc09e066d"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.26.1/resend-linux-x64.tar.gz"
      sha256 "2a1d3c31e592e3e2625c529ca6b65d3949e6163f242c60fcc958b0062fa667ed"
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
