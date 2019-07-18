class Show < ApplicationRecord
  belongs_to :venue
  has_and_belongs_to_many :artists
end
