class DeleteInicioFromReserva < ActiveRecord::Migration
  def change
  	remove_column :reservas, :inicio
  end
end
