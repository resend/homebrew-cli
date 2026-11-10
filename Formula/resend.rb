class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.28.1/resend-darwin-arm64.tar.gz"
      sha256 "77ea74cb886a24a3ff21c350f056482665874cedf8eda97765f8ed83d09662c5"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.28.1/resend-darwin-x64.tar.gz"
      sha256 "92fad3eac731c95e100dfbf402387ab4e4846e301fd64a900a826ee470344576"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.28.1/resend-linux-arm64.tar.gz"
      sha256 "fdf1a97742ead054c6fa9c7f2d3424bd704c29e83d02a2ee9480784f18db6113"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.28.1/resend-linux-x64.tar.gz"
      sha256 "e2c2469433fe3575b770c52506cbfb4d54d29eecc7ba228a6d85f1151a469420"
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
