class ChangeTitleOfPolls < ActiveRecord::Migration[6.0]
  def change
    change_column_null :polls, :title, null: false
  end
end
