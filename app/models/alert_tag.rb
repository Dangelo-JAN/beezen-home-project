class AlertTag < ApplicationRecord
  belongs_to :alert
  belongs_to :tag
end
