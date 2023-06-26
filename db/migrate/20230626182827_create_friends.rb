class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.string :personality
      t.string :activities
      t.string :diet
      t.string :size

      t.timestamps
    end
  end
end
