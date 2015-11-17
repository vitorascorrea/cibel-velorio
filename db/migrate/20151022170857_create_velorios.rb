class CreateVelorios < ActiveRecord::Migration
  def change
    create_table :velorios do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
