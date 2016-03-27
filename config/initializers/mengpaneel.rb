if Rails.env.production?
  Mengpaneel.configure do |config|
    config.token = ENV.fetch('MIXPANEL_TOKEN')
  end
end
