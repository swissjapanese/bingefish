class Show < ApplicationRecord
  has_many :seasons
  has_many :episodes
  has_many :actors
  has_many :binge_lists
  has_many :users, through: :binge_lists

  mount_uploader :clearart, ClearartUploader
  mount_uploader :fanart, FanartUploader
  mount_uploader :poster, PosterUploader
  mount_uploader :banner, BannerUploader
  mount_uploader :logo, LogoUploader
end
