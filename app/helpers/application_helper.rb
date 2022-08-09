module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    # return it from method and alt for alternate
    image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto shadow d-block")
  end

  # def current_user
  #   # if session[:user_id]
  #   #   User.find(session[:user_id])
  #   # end
  #   # or
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  def logged_in?
    #turning current_user to boolean
    !!current_user
  end
end
