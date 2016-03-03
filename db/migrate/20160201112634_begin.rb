class Begin < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username
      t.string :email
      t.string :display_name
      t.string :password
    end
    add_index :users, :username
    add_index :users, :email
    add_index :users, :display_name

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
