class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/images"
  end

  process :resize_to_fit => [500, 500]

    version :thumb do
    process :resize_to_fit => [100, 100]
  end


end
