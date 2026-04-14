class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.11.0/resend-darwin-arm64.tar.gz"
      sha256 "200c158b032a58ba9fbcf1b8fe20cce491938f3d8099ce8322e00d6787d92d0f"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.11.0/resend-darwin-x64.tar.gz"
      sha256 "d283a1647bcfc04a49e1b7bf8786d62f4de0c44879defbac9d12b22e9a67e4aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.11.0/resend-linux-arm64.tar.gz"
      sha256 "e3ce9b5703632443883a58feaf54cb0e4cbd5cf9403e83390d2eab32aa5762ff"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.11.0/resend-linux-x64.tar.gz"
      sha256 "f8a4baf355dbfa6066acad7062ca3140fa21492ef3751b5d6a5b9c4cda427c1c"
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
