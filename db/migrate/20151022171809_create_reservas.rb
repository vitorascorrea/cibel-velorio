class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.timestamp :inicio
      t.timestamp :contratacao
      t.timestamp :sepultamento
      t.references :atendente, index: true, foreign_key: true
      t.references :sala, index: true, foreign_key: true
      t.references :cemiterio, index: true, foreign_key: true
      t.string :d_obito
      t.string :falecido
      t.string :municipe

      t.timestamps null: false
    end
  end
end
