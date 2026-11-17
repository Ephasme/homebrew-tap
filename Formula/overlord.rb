require_relative "github_release_asset"

class Overlord < Formula
  desc "Deterministic daemon driving herdr worktrees through plan → harden → build → PR → review → merge → deploy"
  homepage "https://github.com/Ephasme/overlord"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overlord/releases/download/v1.0.0/overlord-aarch64-apple-darwin.tar.gz",
          using: GitHubReleaseAssetDownloadStrategy
      sha256 "0dfa8c3de1bc6394999a999d0e7e5e2feb48d0a405e5683901cf3ac1537daa51"
    end
    on_intel do
      url "https://github.com/Ephasme/overlord/releases/download/v1.0.0/overlord-x86_64-apple-darwin.tar.gz",
          using: GitHubReleaseAssetDownloadStrategy
      sha256 "943773cf886574343d550d935a7a9cd67d9669a25b5664358ef454f92433eec1"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overlord/releases/download/v1.0.0/overlord-x86_64-unknown-linux-musl.tar.gz",
        using: GitHubReleaseAssetDownloadStrategy
    sha256 "4a04167a7355f248c3feff3d3fc89200909dfa715fe8a5735ea6acb06139d4ac"
  end

  def install
    bin.install "overlord"
  end

  test do
    assert_match "usage: overlord", shell_output("#{bin}/overlord --bogus-flag 2>&1", 2)
  end
end
