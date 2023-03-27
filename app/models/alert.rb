class Alert < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_many :tasks
  
  has_and_belongs_to_many :tags

end
