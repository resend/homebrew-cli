class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.19.1/resend-darwin-arm64.tar.gz"
      sha256 "096858280501e5d67b85f0c8bb657e5b0ac06fd1510a10cf32d80b315bc2087c"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.19.1/resend-darwin-x64.tar.gz"
      sha256 "6c044bb66f5a8daf2b1de851107402177b1090f083d3eeadd11f69ee8ae0c423"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.19.1/resend-linux-arm64.tar.gz"
      sha256 "440343b6e9b1079ade48ea64ddf32e465d9111b8925cb004028f7cafc030dc1a"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.19.1/resend-linux-x64.tar.gz"
      sha256 "a42c8ae243101ee9725d7e7382a833b5781cff28d91e4ba0c9ae651584822660"
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
