class Complaint < ApplicationRecord
  validates :body, presence: true
end
