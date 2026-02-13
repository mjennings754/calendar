class Schedule < ApplicationRecord
  belongs_to :tenant
  has_many :events
end
