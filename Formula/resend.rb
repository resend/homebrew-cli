class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.8.0/resend-darwin-arm64.tar.gz"
      sha256 "1b1ec1d97973464d14286102e9a05d595b143dbb52d5e3e07d36350cdac8e9e3"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.8.0/resend-darwin-x64.tar.gz"
      sha256 "60cebdc1205254bdb5881b2fc9bd014bbb8a3d37fe810576eb48ec869a8eae34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.8.0/resend-linux-arm64.tar.gz"
      sha256 "7f7b5cef59709ae1992dd53729c38d7ca6515a0c2258fad4b5864b9b55d5151a"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.8.0/resend-linux-x64.tar.gz"
      sha256 "ceaf9675efbde0aa4cd899ceb4667a8dec4b7bce84cef26f2cc27edb2b6577c6"
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
