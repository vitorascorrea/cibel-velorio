class AddJustificativaToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :justificativa, :text
  end
end
