class Spell < ActiveRecord::Base
  validates_presence_of [:name, :url, :level]
end
