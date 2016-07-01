class AllowNullConstraints < ActiveRecord::Migration
  def change
    #shows
    change_column_null(:shows, :updateID, true)
    change_column_null(:shows, :requestcomment, true)
    change_column_null(:shows, :locked, true)
    remove_column :shows, :mirrorupdate
    change_column_null(:shows, :lockedby, true)
    change_column_null(:shows, :disabled, true)
    change_column_null(:shows, :tms_wanted_old, true)
    change_column_null(:shows, :tms_priority, true)

    #seasons
    change_column_null(:seasons, :locked, true)
    remove_column :seasons, :mirrorupdate
    change_column_null(:seasons, :lockedby, true)
    change_column_null(:seasons, :tms_wanted, true)

    #episodes
    change_column_null(:episodes, :locked, true)
    change_column_null(:episodes, :lastupdatedby, true)
    change_column_null(:episodes, :thumb_author, true)
    remove_column :episodes, :mirrorupdate
    change_column_null(:episodes, :lockedby, true)
    change_column_null(:episodes, :tms_review_blurry, true)
    change_column_null(:episodes, :tms_review_dark, true)
    change_column_null(:episodes, :tms_review_logo, true)
    change_column_null(:episodes, :tms_review_other, true)
    change_column_null(:episodes, :tms_review_unsure, true)
    remove_column :episodes, :tms_priority

    #actors
    remove_column :actors, :LastUpdate
    remove_column :actors, :LastUpdateBy
  end
end
