class AddDescriptionToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :description, :string
  end
end
