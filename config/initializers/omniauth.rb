Rails.application.config.middleware.use OmniAuth::Builder do
  #Load Omniauth when Rails starts.
  provider :identity
end