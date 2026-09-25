class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.22.0/resend-darwin-arm64.tar.gz"
      sha256 "f40894dd268072e2d641bb9e1eca7eadd4368217683a66c8ffd121d57c742423"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.22.0/resend-darwin-x64.tar.gz"
      sha256 "73c76834e79ed428b80559549526d6f6065a17f58ff982485369d46acfd88450"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.22.0/resend-linux-arm64.tar.gz"
      sha256 "87443ae22b2ef6096c9b516985478ad2a871c90a5ec76e917f5bd515a568b5c7"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.22.0/resend-linux-x64.tar.gz"
      sha256 "95fe8d348440abdec6db30767d6a6be4e7985d55412d15d701f8efb529fca02c"
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
