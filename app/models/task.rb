class Task < ApplicationRecord
  belongs_to :user
  has_many :alerts, dependent: :destroy
end
