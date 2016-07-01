class RemoveUneededIndeces < ActiveRecord::Migration
  def change
    # shows
    remove_index(:shows, name: 'mirrorupdate')
    remove_index(:shows, name: 'disabled')

    # seasons
    remove_index(:seasons, name: 'mirrorupdate')

    # episodes
    remove_index(:episodes, name: 'filename')
    remove_index(:episodes, name: 'IMDB_ID')
    remove_index(:episodes, name: 'lastupdated')
    remove_index(:episodes, name: 'mirrorupdate')
    remove_index(:episodes, name: 'tms_export')
    remove_index(:episodes, name: 'tms_export_2')
    remove_index(:episodes, name: 'tms_export_3')
    remove_index(:episodes, name: 'tms_priority')
  end
end
