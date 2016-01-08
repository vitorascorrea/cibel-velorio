class AddResponsavelToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :responsavel, :integer
  end
end
