class CreateGroupPolls < ActiveRecord::Migration[6.0]
  def change
    create_table :group_polls do |t|
      t.references :poll, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
