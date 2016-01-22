class CreateJustificativas < ActiveRecord::Migration
  def change
    create_table :justificativas do |t|
      t.integer :atendente
      t.timestamp :horario
      t.integer :sala
      t.integer :reserva

      t.timestamps null: false
    end
  end
end
