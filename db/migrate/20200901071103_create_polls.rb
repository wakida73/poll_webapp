class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :title
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
