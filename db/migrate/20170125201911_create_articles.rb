class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :summary
      t.string :footer
      t.integer :creator_id

      t.timestamps
    end
  end
end
