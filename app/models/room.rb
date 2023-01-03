class Room < ApplicationRecord
  has_many :reservations,dependent: :destroy
  has_one_attached :image
  belongs_to :user

  validate :image
end
