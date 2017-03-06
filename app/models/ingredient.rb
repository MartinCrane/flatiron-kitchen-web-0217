class Ingredient < ActiveRecord::Base
  belongs_to :recipe_ingredients

  validates :name, presence: true

end
