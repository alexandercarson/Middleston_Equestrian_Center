class CogginUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::MiniMagick
  process resize_to_fit: [1000, 1000]

  def store_dir
    "public/uploads/coggin/coggin/"
  end
end
