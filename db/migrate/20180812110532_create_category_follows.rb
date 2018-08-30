class CreateCategoryFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :category_follows do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
