require_relative "github_release_asset"

class Overlord < Formula
  desc "Deterministic daemon driving herdr worktrees through plan → harden → build → PR → review → merge → deploy"
  homepage "https://github.com/Ephasme/overlord"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/Ephasme/overlord/releases/download/v0.1.0/overlord-aarch64-apple-darwin.tar.gz",
          using: GitHubReleaseAssetDownloadStrategy
      sha256 "055ccd0c6a6dc86c66e1d1af463c2f07d1b2de382fda5d440d1ce97a715fef9b"
    end
    on_intel do
      url "https://github.com/Ephasme/overlord/releases/download/v0.1.0/overlord-x86_64-apple-darwin.tar.gz",
          using: GitHubReleaseAssetDownloadStrategy
      sha256 "43708118d798d47877ab3dcf705cfcfc8667f7e16a6973b17471abff5eb70d05"
    end
  end

  on_linux do
    url "https://github.com/Ephasme/overlord/releases/download/v0.1.0/overlord-x86_64-unknown-linux-musl.tar.gz",
        using: GitHubReleaseAssetDownloadStrategy
    sha256 "9a42062522942384ee3992294f4f4ae731d525d196adbe78d98ef2bbb30acc41"
  end

  def install
    bin.install "overlord"
  end

  test do
    assert_match "usage: overlord", shell_output("#{bin}/overlord --bogus-flag 2>&1", 2)
  end
end
