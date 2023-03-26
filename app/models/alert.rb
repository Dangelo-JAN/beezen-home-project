class Alert < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_many :tasks
  
  has_many :alert_tags
  has_many :tags, through: :alert_tags

end
