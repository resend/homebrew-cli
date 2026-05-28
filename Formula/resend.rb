class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.3.0/resend-darwin-arm64.tar.gz"
      sha256 "78514a8611e74a34f95f372ebf49639b229f8e99ef1b5069645b01b076723438"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.3.0/resend-darwin-x64.tar.gz"
      sha256 "22f997b21a110ba851ce47880d28e3f034cfdea82ecf0f9347aa3bb9a5708661"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.3.0/resend-linux-arm64.tar.gz"
      sha256 "04fa6631135afa0c3a4a4a3a44d913064491b47c4c635eec26e2c0d8e3b31935"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.3.0/resend-linux-x64.tar.gz"
      sha256 "ee42467d914706dea435cdac13fa764f0b9e8de403aaf6471bd024a6b8613952"
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
