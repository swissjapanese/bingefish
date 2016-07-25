class Episode < ApplicationRecord
  belongs_to :shows
  belongs_to :seasons
end
