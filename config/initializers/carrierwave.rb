CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['aws_access_key_id'],
      :aws_secret_access_key  => ENV['aws_secret_access_key'],
      :region                 => ENV['s3_bucket_region']
    }
    config.fog_directory  = ENV['s3_bucket_name']
    # Forcing use of HTTP
    config.asset_host = 'http://#{config.fog_directory}.s3.amazonaws.com'
  else
    config.storage = :file
  end  
end

