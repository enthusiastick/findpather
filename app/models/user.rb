class User < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :email, :google_id
  has_many :spells
  has_many :custom_spells
end
