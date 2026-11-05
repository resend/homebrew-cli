class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.28.0/resend-darwin-arm64.tar.gz"
      sha256 "6c8b944b53055896bab5287d6f0adf158fdc5f1f2f4dc0a5b5728aa572c38517"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.28.0/resend-darwin-x64.tar.gz"
      sha256 "c69180f06f2a0ba64ed697df0e5f67012f746d65571c667034b39724ddcebb3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.28.0/resend-linux-arm64.tar.gz"
      sha256 "a03fa3daada607e39625bc926a72bdfe1302003dbba6f72afe33040e0b5d440c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.28.0/resend-linux-x64.tar.gz"
      sha256 "bf98fbf20c9beec0beca2a05dfa3eccd2591471a702014caf8f7aacf60e5e523"
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
