class AddAcaoToJustificativa < ActiveRecord::Migration
  def change
    add_column :justificativas, :acao, :text
  end
end
