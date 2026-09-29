class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.23.0/resend-darwin-arm64.tar.gz"
      sha256 "ad50ecdfd47a95a7781faad69985df2cd93171a9015358d5c0c15ae147b914bd"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.23.0/resend-darwin-x64.tar.gz"
      sha256 "5ba1dc819253455dfa42eabe27cdae73af1f5946ad60ab40fac072afc9c26242"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.23.0/resend-linux-arm64.tar.gz"
      sha256 "b067942b2116090ef2ebef6bfa4105d8703bcf78dc1c06ccf517bf9f64f5e034"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.23.0/resend-linux-x64.tar.gz"
      sha256 "b693c03d815c85a429445fa1a70ad7ce3c018f2587625ce55d79a37dcd5e733e"
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
