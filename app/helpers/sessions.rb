helpers do

  def current_user
      if session[:user_id] == nil
      	return nil
      else
      @user = User.find(session[:user_id])
  	end
  end

  def current_user_name
    current_user = User.find(session[:user_id])
    return current_user.name
  end

end
