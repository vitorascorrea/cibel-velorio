class AddMesmoToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :mesmo_local, :boolean
  end
end
