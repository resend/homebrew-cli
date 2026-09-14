class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.21.0/resend-darwin-arm64.tar.gz"
      sha256 "569cc2d004ca825d4835d451881dbe98e979b32375738fa49457b19e4ee6c96d"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.21.0/resend-darwin-x64.tar.gz"
      sha256 "b705345e84a9c552c1f7b1e150212a62cabc648db9bb32ad06b85a639fc19e9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v2.21.0/resend-linux-arm64.tar.gz"
      sha256 "ae8417dce6b110a2ad7caaef46a8071b5adfd67ab2ae783690a6b429bec27165"
    else
      url "https://github.com/resend/resend-cli/releases/download/v2.21.0/resend-linux-x64.tar.gz"
      sha256 "ced5f59ab158ee00fe2d59b24b30a1f0802dffcd870206651cbba61573b10c79"
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
