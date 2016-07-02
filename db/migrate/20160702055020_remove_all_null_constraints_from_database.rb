class RemoveAllNullConstraintsFromDatabase < ActiveRecord::Migration
  def change
    change_column_null(:shows, :series_name, true)
    change_column_null(:seasons, :season, true)
    change_column_null(:episodes, :episode_number, true)
  end
end
