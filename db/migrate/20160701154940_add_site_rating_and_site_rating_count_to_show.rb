class AddSiteRatingAndSiteRatingCountToShow < ActiveRecord::Migration
  def change
    add_column :shows, :site_rating, :decimal, precision: 5, scale: 2
    add_column :shows, :site_rating_count, :integer
  end
end
