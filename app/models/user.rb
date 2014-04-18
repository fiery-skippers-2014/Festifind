require 'BCrypt'

class User < ActiveRecord::Base
  validates_presence_of :name, :email, :password_hash
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6}
  # BUGBUG Can't require a password because of BCrypt. User migrate stores
  # 'password_hash' instead of 'password' so validating on 'password is useless'
  # BCrypts 'password_hash' is a long string, so we can't validate on length,
  # and it even encrypts '' (empty string), so validating presence of 'password_hash'
  # won't matter since it will be present even if no password is entered.
  # - Drew
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
