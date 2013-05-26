def current_user
  @current_user ||= User.where(:id => session[:user_id]).first
end

def image(image_url)
 	image_path = image_url.match(/(images.*)/)
 	"<img src=#{$1}>"
  end
