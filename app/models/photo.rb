class Photo < ActiveRecord::Base
	belongs_to :album
  has_many :likes
  	mount_uploader :file, MyUploader




end


