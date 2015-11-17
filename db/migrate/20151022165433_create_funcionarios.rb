class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :password_digest
      t.string :rf

      t.timestamps null: false
    end
  end
end
