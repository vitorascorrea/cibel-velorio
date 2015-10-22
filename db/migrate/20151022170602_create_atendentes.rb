class CreateAtendentes < ActiveRecord::Migration
  def change
    create_table :atendentes do |t|
      t.references :agencia, index: true, foreign_key: true
      t.boolean :adm
      t.references :funcionario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
