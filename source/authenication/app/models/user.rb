class User < ActiveRecord::Base
  
include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.validate_email(email)
    User.exists?(:email => email)
  end

  def self.authenticate_user(email, password)
  	@person = User.find_by_email(email)
  	if @person && @person.password == password
  		p @person
      return @person
    else
      return nil
    end  
  end
end
