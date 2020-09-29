class ChangeTextOfLists < ActiveRecord::Migration[6.0]
  def change
    change_column_null :lists, :text, null: false
  end
end
