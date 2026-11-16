# Downloads release assets from private GitHub repositories using the
# standard `releases/download` URL, resolving the API asset URL only at
# download time so that loading the formula makes no GitHub API calls.
# Credential: whatever brew already has — HOMEBREW_GITHUB_API_TOKEN, the gh
# CLI, or the keychain (GitHub::API.credentials resolution order).
require "download_strategy"
require "utils/github"

class GitHubReleaseAssetDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    match = url.match(%r{^https://github\.com/([^/]+)/([^/]+)/releases/download/([^/]+)/([^/]+)$})
    raise CurlDownloadStrategyError.new(url, "Not a GitHub release asset URL.") unless match

    @owner, @repo, @tag, @filename = match.captures
  end

  private

  def asset
    @asset ||= begin
      release = GitHub::API.open_rest(
        "#{GitHub::API::API_URL}/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}",
        scopes: ["repo"],
      )
      found = release.fetch("assets").find { |a| a.fetch("name") == @filename }
      raise CurlDownloadStrategyError.new(url, "No release asset named #{@filename} found.") unless found

      found
    end
  end

  def resolve_url_basename_time_file_size(_url, timeout: nil)
    a = asset
    [a.fetch("url"), @filename, Time.parse(a.fetch("updated_at")), a.fetch("size"), a.fetch("content_type"), false]
  end

  def _fetch(url:, resolved_url:, timeout:)
    token = GitHub::API.credentials.to_s
    header = ["Accept: application/octet-stream"]
    header << "Authorization: Bearer #{token}" unless token.empty?
    curl_download(resolved_url, to: temporary_path, try_partial: @try_partial, timeout:, header:)
  end
end
