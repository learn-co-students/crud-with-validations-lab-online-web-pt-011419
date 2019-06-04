class Song < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.current.year }, unless: :not_released?



  def not_released?
    !self.released
  end


end
