class AddReferencesToVelorio < ActiveRecord::Migration
  def change
    add_reference :velorios, :cemiterio, index: true, foreign_key: true
  end
end
