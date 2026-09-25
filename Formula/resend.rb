class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/archive/refs/tags/v2.22.0.tar.gz"
      sha256 "081d4c73ff02ba039b4e984578b1cd4dfea2c0e47406ef3e6b7aefd012206e56"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.21.1/resend-darwin-x64.tar.gz"
      sha256 "fdd9fe9585b42825a0d016903516432e663835bd7b90e9b6dfea4b938c60d396"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.21.1/resend-linux-arm64.tar.gz"
      sha256 "ca158aab7d23766fcf906ed501aad486f7fb58c55c9a1267c3b9835844e02aa1"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.21.1/resend-linux-x64.tar.gz"
      sha256 "d0fb6657f3fcc4689c5ac4d12bda08b7bcbb45f6c9240530817f7da2636c2804"
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
