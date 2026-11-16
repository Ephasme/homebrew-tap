class Overlord < Formula
  desc "Deterministic daemon driving herdr worktrees through plan → harden → build → PR → review → merge → deploy"
  homepage "https://github.com/Ephasme/overlord"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overlord/releases/download/v0.1.0/overlord-aarch64-apple-darwin.tar.gz"
      sha256 "81b53b3fb45e201d7462f77f9b764671f7cdd8dbea310b98ca0cb3c5c36ec51f"
    end
    on_intel do
      url "https://github.com/Ephasme/overlord/releases/download/v0.1.0/overlord-x86_64-apple-darwin.tar.gz"
      sha256 "WILL_BE_REPLACED_BY_RELEASE"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overlord/releases/download/v0.1.0/overlord-x86_64-unknown-linux-musl.tar.gz"
    sha256 "WILL_BE_REPLACED_BY_RELEASE"
  end

  def install
    bin.install "overlord"
  end

  test do
    assert_match "usage: overlord", shell_output("#{bin}/overlord --bogus-flag 2>&1", 2)
  end
end
