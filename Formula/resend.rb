class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "2.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.2.0/resend-darwin-arm64.tar.gz"
      sha256 "af9f61fe0b65f5a677f3cfce4be3302c21aef885d9a9ba56d52de0fce09de757"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.2.0/resend-darwin-x64.tar.gz"
      sha256 "8d9b581ddc4e84d98647c2364804f8e05ec384660d7a5285d519de8bc46d0286"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.2.0/resend-linux-arm64.tar.gz"
      sha256 "38c3311e81182a4bf3659163020a84dbfc0b0ec5ac547ff5f3bb601873eb5daf"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.2.0/resend-linux-x64.tar.gz"
      sha256 "536cf3b1bfc75a6e1e6362c497805f14f11617c1b9016e26e88a308b975f9665"
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
