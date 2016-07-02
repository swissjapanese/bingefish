class RemoveZap2ItIndexFromShow < ActiveRecord::Migration
  def change
    remove_index(:shows, name: 'zap2it_id')
  end
end
