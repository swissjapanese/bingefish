class FanartUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :aws

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end

  version :medium do
    process resize_to_fit: [1200,675]
  end

  version :thumb, from_version: :medium do
    process resize_to_fit: [350,197]
  end
end
