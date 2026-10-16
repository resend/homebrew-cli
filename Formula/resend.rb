class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/archive/refs/tags/v2.26.0.tar.gz"
      sha256 "a9d78718ad785b244b86af86cea5faefa6197db78b0ad71babe853f97dd3c69c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.25.0/resend-darwin-x64.tar.gz"
      sha256 "343c28465b9aded081f96c52a52e52501e33205fe3852f62ec7de0d7a19d8ac6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.25.0/resend-linux-arm64.tar.gz"
      sha256 "a2aa528cb05232f3d281ff5a39486068f313f80de5ded875cca29d5a143b3c91"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.25.0/resend-linux-x64.tar.gz"
      sha256 "e71063b0a836b0a18fc0c68aca6491f3131a639c3fc7820a03bae222d7d62780"
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
