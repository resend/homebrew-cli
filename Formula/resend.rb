class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.9.0/resend-darwin-arm64.tar.gz"
      sha256 "a33c7467d3e7d7bf0c957fc2e7620f3dc302f23304e245aae658cd4f2dc8e2e7"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.9.0/resend-darwin-x64.tar.gz"
      sha256 "a13e40e5e64d106d2804bc9de01d61ec15b8b08ca3b2affa6515e5f0e223e5d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.9.0/resend-linux-arm64.tar.gz"
      sha256 "4075012881d0b84a635598ea8637a5ff6c9d48a5c0183e8e46a50a91319f255b"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.9.0/resend-linux-x64.tar.gz"
      sha256 "b68ba9cfd80b6c264d30bea91e8eba451dae7dc85a9667e53eac13c7eaa6122d"
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
