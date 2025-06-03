class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Role validation
  # Valid roles: "guest", "host", "both"
  # lets use 'allow_blank' since we want the feature to demo but we dont want it to cause problims
  validates :role, inclusion: { in: %w[guest host both], allow_blank: true }
end
