class Show < ActiveRecord::Base
  has_many :show_images
  has_many :seasons
  has_many :episodes
  has_many :casts
  has_many :actors, through: :cast

  paginates_per 25

  def poster_url
    show_images.last.present? ? show_images.last.image_url : "http://placehold.it/300x400"
  end
end
