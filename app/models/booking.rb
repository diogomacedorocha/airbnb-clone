class Booking < ApplicationRecord
  belongs_to :user   # this is the guest
  belongs_to :flat

  validates :status, inclusion: { in: %w[pending accepted declined], allow_blank: true }
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    errors.add(:end_date, "must be after the start date") if end_date <= start_date
  end
end
