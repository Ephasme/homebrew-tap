require_relative "github_release_asset"

class Overlord < Formula
  desc "Deterministic daemon driving herdr worktrees through plan → harden → build → PR → review → merge → deploy"
  homepage "https://github.com/Ephasme/overlord"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overlord/releases/download/v0.2.0/overlord-aarch64-apple-darwin.tar.gz",
          using: GitHubReleaseAssetDownloadStrategy
      sha256 "e59ee0338cf27b5e8f8928af9de47c5d113e57012d9cd46ce38c166ceea35be0"
    end
    on_intel do
      url "https://github.com/Ephasme/overlord/releases/download/v0.2.0/overlord-x86_64-apple-darwin.tar.gz",
          using: GitHubReleaseAssetDownloadStrategy
      sha256 "a991d6aa1f2b8806dbb52f668b360ca68e4ea414e2acb0be597fdabfa847f7af"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overlord/releases/download/v0.2.0/overlord-x86_64-unknown-linux-musl.tar.gz",
        using: GitHubReleaseAssetDownloadStrategy
    sha256 "c5beb3ba9153bcafa1978728cbca86530726eed62712c4312ce8f1721cdd741f"
  end

  def install
    bin.install "overlord"
  end

  test do
    assert_match "usage: overlord", shell_output("#{bin}/overlord --bogus-flag 2>&1", 2)
  end
end
