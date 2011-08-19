CarrierWave.configure do |config|
  if Rails.env.production?
    config.s3_bucket = "thalamus-demo.storage.skalar.no"
  else
    config.s3_bucket = "thalamus-development.storage.skalar.no"
  end

  config.s3_access_key_id = 'AKIAI7H2J2JGBLVWWBQQ'
  config.s3_secret_access_key = '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'
  config.s3_cnamed = true
  config.s3_region = 'eu-west-1'
  if Rails.env.test? or Rails.env.cucumber? or Rails.env.development?
    # unable to access various overlays unless image is resized
    config.enable_processing = false unless Rails.env.development?
  end
end