class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave
    storage :file

  def store_dir
    "uploads/images"
  end

end
