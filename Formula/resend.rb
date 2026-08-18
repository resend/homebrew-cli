class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/archive/refs/tags/v2.13.0.tar.gz"
      sha256 "9851199cb7205891fd06678079fcac29c310a4a04fe550adfb687ae7373fd0d2"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.11.0/resend-darwin-x64.tar.gz"
      sha256 "e0cec791aa830a1d3bac6b862138fbcabb9bbe087ef0a53979faf2ab889fc827"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.11.0/resend-linux-arm64.tar.gz"
      sha256 "07671827744d0b960bcd756e463a4f5cb315f2b67526f3dd09c391c7788a1333"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.11.0/resend-linux-x64.tar.gz"
      sha256 "dc226579ad6ee045eaa0c4ca8a4140db5179af190ce393ef5f3c1f7a9d1b5f15"
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
