class Season < ApplicationRecord
  belongs_to :shows
  has_many :episodes
end
