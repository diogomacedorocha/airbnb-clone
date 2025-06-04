class Flat < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  has_many :bookings, dependent: :destroy
=======
  has_many_attached :photos
>>>>>>> b759c430be7180d6f66fc2f82d335424b6666968
end
