class AlterProduct < ActiveRecord::Migration[6.0]
  def change
    add_index :products,:name
  end
end
