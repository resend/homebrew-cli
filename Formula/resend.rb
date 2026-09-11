class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.20.1/resend-darwin-arm64.tar.gz"
      sha256 "b8264568fb48b03bd3022fb8475afada4d1fcb6b115a80b6acb95535e8a8c88d"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.20.1/resend-darwin-x64.tar.gz"
      sha256 "87c0fe9fcd840197fcf8e9bff8420dda027c36835e42af1447498238038bca42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.20.1/resend-linux-arm64.tar.gz"
      sha256 "c46fddd339c56d869d73d25ae725db7c3af185c446ca73ca986d0f4ba2925aff"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.20.1/resend-linux-x64.tar.gz"
      sha256 "f9cde0fa466328f822a69846d77169dffe58e8d3c0176075867ed4e0ffe7e684"
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
