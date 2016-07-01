class Season < ActiveRecord::Base
  belongs_to :shows
  has_many :episodes
end
