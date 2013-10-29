CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',    # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],    # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],    # required
    :region                 => 'eu-west-1', # which refers to Ireland # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['WDI_S3_BUCKET_PROJECT_1'] # required
  config.fog_public     = true                # optional, defaults to true
end