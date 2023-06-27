class Friend < ApplicationRecord
  validates :name, :age, :diet, :size, :activities, :personality, :img, :species, presence: true
  validates :activities, length:{minimum: 10}
end
