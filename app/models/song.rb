class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, numericality:(less_than_or_equal_to Time.current.year) !not_released
  validates :released, inclusion: {in: [true, false]}
  validates :genre, presence: true 
  
  def not_released
    !self.released
  end 
end 