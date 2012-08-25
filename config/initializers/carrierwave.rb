CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJQCCQHBNDX2M5XCQ',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'ap-southeast-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'test-gianhangao'                     # required
end