class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.6.0/resend-darwin-arm64.tar.gz"
      sha256 "9cc6ba2aa563d6bfbbf24d7540813a05654fe7056e5ad48d7842a73bebd60910"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.6.0/resend-darwin-x64.tar.gz"
      sha256 "c064a0d1392b5da6e917daeadfd0cf86c318fd096da921228949ae0d27cae5be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.6.0/resend-linux-arm64.tar.gz"
      sha256 "f6af0768144bb5122e251de2b80155a23fda267379c4cc9a3880669de547a196"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.6.0/resend-linux-x64.tar.gz"
      sha256 "b43addd8888667b8fafb3737b09cfbc52bf7c6282a854827d1e2fe83e592c281"
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
