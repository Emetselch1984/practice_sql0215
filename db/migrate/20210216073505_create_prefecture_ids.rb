class CreatePrefectureIds < ActiveRecord::Migration[6.0]
  def change
    create_table :prefecture_ids do |t|
      t.string :name
      t.timestamps
    end
  end
end
