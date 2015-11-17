class AddVelorioToReservas < ActiveRecord::Migration
  def change
    add_reference :reservas, :velorio, index: true, foreign_key: true
  end
end
