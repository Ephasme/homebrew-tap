class Overseer < Formula
  desc "One overseer agent coordinating a fleet of coding agents"
  homepage "https://github.com/Ephasme/overseer"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overseer/releases/download/v0.1.1/overseer-aarch64-apple-darwin.tar.gz"
      sha256 "3edb93a43578983c330fe0ac8a171c0bda74bdb177e73e292dbab5bc72e13c0f"
    end
    on_intel do
      url "https://github.com/Ephasme/overseer/releases/download/v0.1.1/overseer-x86_64-apple-darwin.tar.gz"
      sha256 "f872ab5e229e10d244db6fd0c269083f77756f178aab95e488f17f461e7d9596"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overseer/releases/download/v0.1.1/overseer-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d27e47758b354bc8d5020ceb7e8b47c03eba824ed7a8ea795b09344b469cfe49"
  end

  def install
    bin.install "overseer"
  end

  test do
    assert_match "OVERSEER_API_KEY is not set", shell_output("env -u OVERSEER_API_KEY #{bin}/overseer 2>&1", 1)
  end
end
