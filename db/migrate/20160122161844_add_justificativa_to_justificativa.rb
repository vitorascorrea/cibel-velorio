class AddJustificativaToJustificativa < ActiveRecord::Migration
  def change
    add_column :justificativas, :justificativa, :text
  end
end
