class ClearartUploader < CarrierWave::Uploader::Base
  storage :aws

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/clearart"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end
end
