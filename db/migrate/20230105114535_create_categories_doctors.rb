class CreateCategoriesDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_doctors, id: false do |t|

      t.belongs_to :category, index: true
      t.belongs_to :doctor, index: true
    end
  end
end
