class ChangingColumnsToBeMoreTreeFriendly < ActiveRecord::Migration[7.0]
  def change
    remove_column :friends, :size, :integer
    remove_column :friends, :diet, :text
  end
end
