class CreateCemiterios < ActiveRecord::Migration
  def change
    create_table :cemiterios do |t|
      t.string :nome
      t.references :velorio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
