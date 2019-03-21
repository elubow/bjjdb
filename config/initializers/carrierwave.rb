# config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end
  
  # Use AWS storage if in production
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :use_iam_profile        => true,
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'] || '',
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'] || '',
    :region                 => ENV['S3_REGION_NAME'] || 'us-east-1'
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME'] || 'bjjdb-test'
  config.storage = :fog
end
