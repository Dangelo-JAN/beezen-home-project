class Task < ApplicationRecord
  belongs_to :user
  belongs_to :alert, optional: true, touch: true
  delegate :name, to: :category, prefix: :category, allow_nil: true
  
  validates :name, :description, presence: true

  def to_param
    "#{id}-#{name.downcase.to_s[0..100]}".parameterize
  end
end
