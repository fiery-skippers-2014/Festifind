class Band < ActiveRecord::Base
  has_many :groupies
  has_many :users, through: :groupies
end
