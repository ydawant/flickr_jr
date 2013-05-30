class Album < ActiveRecord::Base
	has_many :photos
	belongs_to :user

  def not_empty?
    self.photos.length != 0
  end

  def public?
    self.private == false
  end

  def private?
    self.private == true
  end

  def date
    updated_at.to_s.gsub(/(\d{4})-(\d{2})-(\d{2}).*/,'\2-\3-\1')
  end
end
