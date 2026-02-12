class Tenant < ApplicationRecord
  belongs_to :user
  validates_presence_of :name
  has_many :seats, dependent: :destroy
  has_many :users, through: :seats
  belongs_to :parent, class_name: "User", foreign_key: "user_id"
end
