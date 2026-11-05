class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/archive/refs/tags/v2.28.0.tar.gz"
      sha256 "895dbc224996b2199de86068eaa8016ae578cefc67ef6e95860b90fa44b363d5"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.27.1/resend-darwin-x64.tar.gz"
      sha256 "753c63ebc1ec47f5879c8d14cc4dafc064de5e11c888c8a84d3d9d8253453397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.27.1/resend-linux-arm64.tar.gz"
      sha256 "e505617e83a29047f1fc0d74fc6198ad22bd5616adf6eabbe1fe51a6f98c3bca"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.27.1/resend-linux-x64.tar.gz"
      sha256 "cfafe0659414175c03109108e94d0aa0c976e024c0058f8aac383e71c7b0fea7"
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
