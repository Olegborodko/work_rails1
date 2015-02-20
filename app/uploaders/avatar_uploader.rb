# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick
   include Cloudinary::CarrierWave
  # Choose what kind of storage to use for this uploader:
  #  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "users/my_user/#{model.id}"
  # end

  #process :resize_to_fit => [1024, 768]

  # version :thumb do
  #   process :resize_to_fit => [80, 80]
  # end
  
  # version :medium do
  #   process :resize_to_fit => [200, 200]
  # end



  #cloudinary
  process :tags => ['post_picture']

  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]
  end
  
  version :thumbnail do
    resize_to_fit(50, 50)
  end

  # def public_id
  #   return model.short_name
  # end  
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
