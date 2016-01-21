class AddJustificativaToSala < ActiveRecord::Migration
  def change
    add_column :salas, :justificativa, :text
  end
end
