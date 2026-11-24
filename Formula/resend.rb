class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.30.0/resend-darwin-arm64.tar.gz"
      sha256 "2b810f7477a97929053763df9840f48aa762ae31021e231605fba322cc9a7c9c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.30.0/resend-darwin-x64.tar.gz"
      sha256 "962bb2b5ed363c2e9aeddff6b1c074b87945fafda33e0e09c5177e40f1659333"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.30.0/resend-linux-arm64.tar.gz"
      sha256 "af96f74de741719e4ee00f7a9c3138697b305e0a4d61d642f512799b4f113476"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.30.0/resend-linux-x64.tar.gz"
      sha256 "c18e28aeea30497c6e79feeb041199f88271abeb7149aae71a49ef7e661285a7"
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
