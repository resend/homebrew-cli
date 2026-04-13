class Resend < Formula
  desc "Command-line interface for Resend"
  homepage "https://resend.com/cli"
  version "1.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.10.0/resend-darwin-arm64.tar.gz"
      sha256 "fa451a76e72b2bc75d93e51207c686c893b704430999d0c55a9a60023e3cb0b6"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.10.0/resend-darwin-x64.tar.gz"
      sha256 "ca4bb195299165438f1357a6b870e28eb5ab2fcc7309a3fcd8f2270e6d9d1123"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/resend/resend-cli/releases/download/v1.10.0/resend-linux-arm64.tar.gz"
      sha256 "702024053c950aac95829b0397cb34179be416b2f28a236e2b7dc9dd5291cd12"
    else
      url "https://github.com/resend/resend-cli/releases/download/v1.10.0/resend-linux-x64.tar.gz"
      sha256 "6c006b4e77fadcdc85a757f634cffeee87e7acc64da040085223cb75d01bc54d"
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
