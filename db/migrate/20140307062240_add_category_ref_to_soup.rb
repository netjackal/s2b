class AddCategoryRefToSoup < ActiveRecord::Migration
  def change
    add_reference :soups, :category, index: true
  end
end
