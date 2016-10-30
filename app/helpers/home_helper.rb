module HomeHelper
  def current_user
    User.find_by(id: session[:user_id]) || NullUser.new
  end
end
