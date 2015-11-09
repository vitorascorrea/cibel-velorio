class AddIndexToFuncionarioRf < ActiveRecord::Migration
  def change
  	add_index :funcionarios, :rf, unique: true
  end
end
