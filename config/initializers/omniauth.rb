Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :instagram, '009e3b31bc4a4f2586d1f5d146707c87', 'e475031b081f4f57ad8249857d54f819'
end