class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :poll_id
      t.string :text
      t.integer :count

      t.timestamps
    end
  end
end
