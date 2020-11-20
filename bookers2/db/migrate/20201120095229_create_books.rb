class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :title_name
      t.string :profile_image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
