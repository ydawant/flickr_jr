class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

    process :resize_to_fill => [400, 400]

  def store_dir
    "#{APP_ROOT}/public/uploads/images"
  end

end
