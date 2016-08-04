class BingeList < ApplicationRecord
  belongs_to :user
  belongs_to :show

  scope :binged, -> { where binge: true }
  scope :watchlisted, -> { where watchlist: true }
  scope :guiltied, -> { where guilty: true }
  scope :updated, -> { where updated: true }
end
