class Album < ActiveRecord::Base
	has_many :photos
	belongs_to :user

  def not_empty?
    self.photos.length != 0
  end
end
