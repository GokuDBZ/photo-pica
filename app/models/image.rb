class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, AvatarUploader
  
  include CarrierWave::MiniMagick
  
  #TODO need to work in process method which belongs to image magick gem
  #process resize_to_limit: [300, 300]

  validate :image_size
  
  private
  
  def image_size
      if self.picture.size > 5.megabytes
          self.errors.add(:picture,"size cannot be greter than 5 MB")
      end
  end
end
