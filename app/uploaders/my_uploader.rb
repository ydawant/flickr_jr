class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fill => [400, 400]
    storage :file

  def store_dir
    "uploads/images"
  end

end
