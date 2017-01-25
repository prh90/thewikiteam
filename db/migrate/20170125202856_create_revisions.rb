class CreateRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :revisions do |t|
      t.integer :user_id
      t.integer :section_id

      t.timestamps
    end
  end
end
