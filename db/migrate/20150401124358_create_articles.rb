class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.text :description
      t.string :author

      t.timestamps null: false
    end
  end
end
