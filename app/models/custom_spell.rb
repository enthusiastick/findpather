class CustomSpell < ActiveRecord::Base
  validates_presence_of :name, :level, :school, :casting_time, :components, :target, :duration, :description
  belongs_to :user
end
