class ChangeCountOfLists < ActiveRecord::Migration[6.0]
  def up
    change_column :lists, :count, :integer, default: 0
  end

  def down
    change_column :lists, :count, :integer
  end
end
