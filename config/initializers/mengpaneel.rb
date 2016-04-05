if Rails.env.production? && ENV['STAGING'] != 'true'
  Mengpaneel.configure do |config|
    config.token = ENV.fetch('MIXPANEL_TOKEN')
  end
end
