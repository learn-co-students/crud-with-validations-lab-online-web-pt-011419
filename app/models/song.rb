class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validate :has_release_year_if_released?


  def has_release_year_if_released?
    if released == false
      return true
    elsif release_year.nil?
      errors.add(:release_year, 'cannot be blank if song has been released')
    elsif release_year > Date.today.year || release_year.zero?
      errors.add(:release_year, 'cannot be 0 or in the future')
    end
  end
end
