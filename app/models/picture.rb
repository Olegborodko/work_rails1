class Picture < ActiveRecord::Base
  # attr_accessible :title, :body
   mount_uploader :avatar, AvatarUploader
   belongs_to :user

   include Rails.application.routes.url_helpers

  #attr_accessible :avatar 
  
  def to_jq_upload
    {
      "name" => read_attribute(:avatar),
      "size" => avatar.size,
      "url" => avatar.url,
      "thumbnail_url" => avatar.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end


end
