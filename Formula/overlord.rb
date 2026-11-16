class Overlord < Formula
  desc "Deterministic daemon driving herdr worktrees through plan → harden → build → PR → review → merge → deploy"
  homepage "https://github.com/Ephasme/overlord"
  version "0.1.0"
  tag "v0.1.0"

  # overlord is a private repo: release assets are not anonymously downloadable. Each platform block asks the
  # GitHub API for the release's assets and downloads with the credentials brew already has
  # (HOMEBREW_GITHUB_API_TOKEN, the gh CLI, or the keychain) via the Accept header trick:
  # application/octet-stream on an asset's API url returns the binary instead of JSON.
  require "utils/github"

  on_macos do
    on_arm do
      url do
        assets = GitHub.get_release("Ephasme", "overlord", tag).fetch("assets")
        asset = assets.find { |a| a["name"] == "overlord-aarch64-apple-darwin.tar.gz" }
        odie "overlord-aarch64-apple-darwin.tar.gz not attached to #{tag}" unless asset
        [asset.fetch("url"), header: [
          "Accept: application/octet-stream",
          "Authorization: bearer #{GitHub::API.credentials}"
        ]]
      end
      sha256 "aarch64-apple-darwin" "81b53b3fb45e201d7462f77f9b764671f7cdd8dbea310b98ca0cb3c5c36ec51f"
    end
    on_intel do
      url do
        assets = GitHub.get_release("Ephasme", "overlord", tag).fetch("assets")
        asset = assets.find { |a| a["name"] == "overlord-x86_64-apple-darwin.tar.gz" }
        odie "overlord-x86_64-apple-darwin.tar.gz not attached to #{tag}" unless asset
        [asset.fetch("url"), header: [
          "Accept: application/octet-stream",
          "Authorization: bearer #{GitHub::API.credentials}"
        ]]
      end
      sha256 "x86_64-apple-darwin" "43708118d798d47877ab3dcf705cfcfc8667f7e16a6973b17471abff5eb70d05"
    end
  end

  on_linux do
    url do
      assets = GitHub.get_release("Ephasme", "overlord", tag).fetch("assets")
      asset = assets.find { |a| a["name"] == "overlord-x86_64-unknown-linux-musl.tar.gz" }
      odie "overlord-x86_64-unknown-linux-musl.tar.gz not attached to #{tag}" unless asset
      [asset.fetch("url"), header: [
        "Accept: application/octet-stream",
        "Authorization: bearer #{GitHub::API.credentials}"
      ]]
    end
    sha256 "x86_64-unknown-linux-musl" "9a42062522942384ee3992294f4f4ae731d525d196adbe78d98ef2bbb30acc41"
  end

  def install
    bin.install "overlord"
  end

  test do
    assert_match "usage: overlord", shell_output("#{bin}/overlord --bogus-flag 2>&1", 2)
  end
end
