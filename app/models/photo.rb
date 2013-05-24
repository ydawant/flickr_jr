class Photo < ActiveRecord::Base
	belongs_to :album
  	mount_uploader :file, MyUploader

  def gsub_url
  	self.file.current_path.gsub!(/(.*\/public)/,'')
  end



end


