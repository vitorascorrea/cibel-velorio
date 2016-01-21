class AddDesabilitadaToSala < ActiveRecord::Migration
  def change
    add_column :salas, :desabilitada, :boolean
  end
end
