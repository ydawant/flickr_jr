class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :new_password
  has_many :albums
  has_many :photos, :through => :albums
  has_many :likes
  mount_uploader :file, MyUploader
  has_many :followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Following', :foreign_key => 'follower_id'  

  def password
    @password ||= Password.new(self.password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params = {})
    @user = User.new(params)
    @user.password = params[:password]
    @user.save!
    @user
  end

  def self.authenticate(params)
    @user = User.find_by_username(params[:username])
    (@user && @user.password == params[:password]) ? @user : false
  end

  def time
    ((Time.now() - self.created_at) / 3600.0).round(1)
  end


end
