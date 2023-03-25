class Task < ApplicationRecord
  belongs_to :user
  belongs_to :alert, optional: true
  
  validates :name, :description, presence: true
end
