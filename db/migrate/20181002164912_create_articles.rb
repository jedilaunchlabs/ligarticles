class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, default: ""
      t.text :description, default: ""

      t.timestamps
    end
  end
end
