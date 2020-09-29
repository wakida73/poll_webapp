class CreatePollUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_users do |t|
      t.references :poll, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
