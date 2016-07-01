class Episode < ActiveRecord::Base
  belongs_to :shows
  belongs_to :seasons
end
