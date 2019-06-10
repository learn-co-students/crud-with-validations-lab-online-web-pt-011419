class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, numericality :true, if: :is_released, unless: :check_year 
  validates :released, inclusion: {in: [true, false]}
  validates :genre, presence: true 
  
  
  def check_year
    if self.release_year > Date.time.year
      false 
    else 
      true 
    end 
  end 
  
  def is_released
    !!(self.released == true)
  end 
  
end 