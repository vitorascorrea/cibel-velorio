class AddOutroToCemiterio < ActiveRecord::Migration
  def change
    add_column :cemiterios, :outro, :boolean
  end
end
