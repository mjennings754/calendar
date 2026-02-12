class Seat < ApplicationRecord
  belongs_to :user
  belongs_to :tenant
end
