class AddIeToReserva < ActiveRecord::Migration
  def change
    add_index :reservas, :excluida
  end
end
