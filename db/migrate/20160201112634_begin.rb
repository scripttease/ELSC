class Begin < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.string :slug
    end
    add_index :users, :slug

    create_table(:images) do |t|
      t.references :user
      t.string :image_url
      t.string :comment
      t.boolean :published, null: false, default: false 

      t.timestamps null: false
    end
    add_index :images, :user_id
  end
end
