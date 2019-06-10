class Song < ApplicationRecord
    validates :artist_name, presence: true
    validates :released, inclusion:{in: [true, false]}
    validates :title, presence: true, uniqueness: true
    with_options if: :released do |s|
        s.validates :release_year, presence: true
        s.validates :release_year, numericality: {less_than_or_equal_to: Time.current.year}
    end
end
