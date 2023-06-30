class AddSizeBackToSchemaAsNumber < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :size, :integer
  end
end
