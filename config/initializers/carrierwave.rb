require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => Rails.application.credentials.access_key_id,
    :aws_secret_access_key => Rails.application.credentials.secret_access_key,
		:region                => 'us-east-2',
		:path_style            => true,
		:host                  => 's3.us-east-2.amazonaws.com',
		:endpoint              => 'https://s3.us-east-2.amazonaws.com'
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = Rails.application.credentials.s3_bucket
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{10.day.to_i}" }
  config.storage = :fog
end
