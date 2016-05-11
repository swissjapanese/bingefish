class Show < ActiveRecord::Base
  paginates_per 25

  def poster_url
    poster.present? ? poster : "http://placehold.it/300x400"
  end
end
