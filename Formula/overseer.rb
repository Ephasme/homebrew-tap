class Overseer < Formula
  desc "One overseer agent coordinating a fleet of coding agents"
  homepage "https://github.com/Ephasme/overseer"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overseer/releases/download/v0.1.0/overseer-aarch64-apple-darwin.tar.gz"
      sha256 "d53e1e9a69b5fddf8ea539b1dee1111fcc1b0edba576844d06c3582482784388"
    end
    on_intel do
      url "https://github.com/Ephasme/overseer/releases/download/v0.1.0/overseer-x86_64-apple-darwin.tar.gz"
      sha256 "0257b0e31ca9598a971b23c6eeca42f939f1f4f810527540e582f5fe92862c7e"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overseer/releases/download/v0.1.0/overseer-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a78f9e8d71bf8f33b2d096544f6e3116b0e2ff3e228cf87fd93a0c817402aa13"
  end

  def install
    bin.install "overseer"
  end

  test do
    assert_match "OVERSEER_API_KEY is not set", shell_output("env -u OVERSEER_API_KEY #{bin}/overseer 2>&1", 1)
  end
end
