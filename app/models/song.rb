class Song < ApplicationRecord
    validates :title, presence: true
    validate :released_release_year 
    validate :release_year_after_now
    validate :same_song_in_one_year

    private
    def released_release_year
        errors.add(:base, "must add release year when song is released") if released == true && release_year == nil
    end

    def release_year_after_now
        errors.add(:base, "must be a year that is before #{Date.current.year}") if release_year != nil && release_year > Date.current.year 
    end 

    def same_song_in_one_year
        errors.add(:base, "must not release same song in one year") if title == Song.find_by(name)
    end
end
