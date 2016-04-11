class AddNcfToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :ncf, :string
  end
end
