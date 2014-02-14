class Spell < ActiveRecord::Base
  validates_presence_of [:name, :url, :level]
  belongs_to :user
end
