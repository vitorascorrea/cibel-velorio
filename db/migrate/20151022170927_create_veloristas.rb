class CreateVeloristas < ActiveRecord::Migration
  def change
    create_table :veloristas do |t|
      t.references :velorio, index: true, foreign_key: true
      t.references :funcionario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
