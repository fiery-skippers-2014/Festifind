helpers do

  def current_user
      if session[:user_id] == nil
      	return nil
      else
      @user = User.find(session[:user_id])
  	end
  end

end
