class Overseer < Formula
  desc "One overseer agent coordinating a fleet of coding agents"
  homepage "https://github.com/Ephasme/overseer"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overseer/releases/download/v0.2.0/overseer-aarch64-apple-darwin.tar.gz"
      sha256 "2ea2272ecd9fb19df0e6b2a4936bb96cf8fab437f659f3af032bdcb3bbe7e196"
    end
    on_intel do
      url "https://github.com/Ephasme/overseer/releases/download/v0.2.0/overseer-x86_64-apple-darwin.tar.gz"
      sha256 "c08d08d452be0c4c3bb46197158b2f6e2c5a3970469bb7f9bf9ebe9114fd078f"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overseer/releases/download/v0.2.0/overseer-x86_64-unknown-linux-musl.tar.gz"
    sha256 "61b6f4274d0a46f6a2787fd3ab66ceab4956074c8964a48b7bb49dcee5c9e51c"
  end

  def install
    bin.install "overseer"
  end

  test do
    assert_match "OVERSEER_API_KEY is not set", shell_output("env -u OVERSEER_API_KEY #{bin}/overseer 2>&1", 1)
  end
end
