




require 'BCrypt'

class User < ActiveRecord::Base
  has_many :groupies
  has_many :bands, through: :groupies

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

  # def self.authenticate_user(email, password)

  #   puts "this is the person"
  #   puts @person
  #   return nil if @person == nil

  # 	if @person.password == password
  # 		puts @person
  #     puts "user was fetched"
  #     return @person
  #   end
  # end
end
