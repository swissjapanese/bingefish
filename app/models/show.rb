class Show < ActiveRecord::Base
  has_many :seasons
  has_many :episodes
  has_many :actors

  mount_uploader :fanart, FanartUploader
end
