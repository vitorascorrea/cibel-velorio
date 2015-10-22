class CreateAgencias < ActiveRecord::Migration
  def change
    create_table :agencias do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
