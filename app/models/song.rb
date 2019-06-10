class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, numericality:(Time.current_year)
  validates :released, inclusion: (true, false)
  validates :genre, presence: true 
end 