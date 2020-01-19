Geocoder.configure(
  timeout: 10,
  lookup: :google,
  language: :en,
  use_https: true,
  api_key: ENV['GOOGLE_API_KEY'],
  units: :mi,
  distances: :linear,
  ip_lookup: :geoip2,
  geoip2: {
    file: Rails.root.join("lib", "db", "GeoLite2-City.mmdb")
  }
)
