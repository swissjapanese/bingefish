class ShowImage < ActiveRecord::Base
  belongs_to :show
  mount_uploader :image, PosterUploader
end
