class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.5.0/resend-darwin-arm64.tar.gz"
      sha256 "a3e0f8c17beb136870d2e2648d4a4d9efca4fa74727d88e37b8e787b8ac1e908"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.5.0/resend-darwin-x64.tar.gz"
      sha256 "a58d12e8b1004162c88ede9b0d350a8a760dce79e3c6ae921e6cc63f33fa0961"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.5.0/resend-linux-arm64.tar.gz"
      sha256 "bba79f15b33a5fc6fa9865724b575297f0e2a990afd7ef57c5a48a0e995f26bc"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.5.0/resend-linux-x64.tar.gz"
      sha256 "fe8a4fe2136e8183e71e7ab6c277a974e57d234dfd01a1e9742f4639eb933c18"
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
