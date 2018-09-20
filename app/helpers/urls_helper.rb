module UrlsHelper
  def shortened_full_url(url)
    "#{request.base_url}/#{url.short_url}"
  end
end
