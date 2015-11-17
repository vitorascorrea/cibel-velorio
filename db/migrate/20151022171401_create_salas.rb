class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.boolean :especial
      t.references :velorio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
