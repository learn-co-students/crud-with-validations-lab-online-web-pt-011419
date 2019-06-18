class Song < ApplicationRecord
    validates :title, presence:true, uniqueness: {scope: [:artist_name, :release_year]} 
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, numericality: true, if: :is_released?, unless: :check_year
    validates :artist_name, presence:true

    def is_released?
        !!(self.released == true)
    end

    def check_year
        if self.release_year != nil
          if  self.release_year > Date.today.year
            errors.add(:release_year, "Year cannot be in the future")
            false
          else
            true
          end
        end
    end

end
