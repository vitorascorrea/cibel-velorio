class AddExcluidaToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :excluida, :boolean
  end
end
