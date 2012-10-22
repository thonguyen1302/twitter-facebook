Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '441717389177891', '4f7d9f350a4c4ad9733d3e3fc6a2206b'
end