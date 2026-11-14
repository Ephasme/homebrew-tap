class Overseer < Formula
  desc "One overseer agent coordinating a fleet of coding agents"
  homepage "https://github.com/Ephasme/overseer"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overseer/releases/download/v0.1.2/overseer-aarch64-apple-darwin.tar.gz"
      sha256 "338c527995ff305423da67125f452a242f9d121ee52b3ff567670e878ee1300c"
    end
    on_intel do
      url "https://github.com/Ephasme/overseer/releases/download/v0.1.2/overseer-x86_64-apple-darwin.tar.gz"
      sha256 "6af95b4502715d114638862aabd15faffb1adcce1a451f1ed08aeef36748afec"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overseer/releases/download/v0.1.2/overseer-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fe69006be20c1e30531ef6018b26b08102a7ee88c3723717f6b8613766ad4012"
  end

  def install
    bin.install "overseer"
  end

  test do
    assert_match "OVERSEER_API_KEY is not set", shell_output("env -u OVERSEER_API_KEY #{bin}/overseer 2>&1", 1)
  end
end
