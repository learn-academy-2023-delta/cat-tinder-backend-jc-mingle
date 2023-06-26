class AddImgColumnToFriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :img, :text
  end
end
