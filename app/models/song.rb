class Song < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :artist

end
