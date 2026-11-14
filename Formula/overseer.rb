class Overseer < Formula
  desc "One overseer agent coordinating a fleet of coding agents"
  homepage "https://github.com/Ephasme/overseer"
  version "0.0.0"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overseer/releases/download/v0.0.0/overseer-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/Ephasme/overseer/releases/download/v0.0.0/overseer-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overseer/releases/download/v0.0.0/overseer-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "overseer"
  end

  test do
    assert_match "OVERSEER_API_KEY is not set", shell_output("env -u OVERSEER_API_KEY #{bin}/overseer 2>&1", 1)
  end
end
