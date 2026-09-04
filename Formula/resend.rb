class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.19.0/resend-darwin-arm64.tar.gz"
      sha256 "2b9dbf5af05ad297df29346fd04b4e6aa0ae1b71b372430d1640396e721fedc8"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.19.0/resend-darwin-x64.tar.gz"
      sha256 "ae1474965d95ab3ec1881cb141f8561bdd9e3ec35d4ae7b881e5a17eb9bb4127"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.19.0/resend-linux-arm64.tar.gz"
      sha256 "5f9558c0aa2418dec7e3cd4115762c10a7c16a61becea5786587214bba21babc"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.19.0/resend-linux-x64.tar.gz"
      sha256 "e9263f7d3e46a3ef586c700cf876ba7249c882c73470dba56558860758dace65"
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
