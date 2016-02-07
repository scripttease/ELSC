class Begin < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name
      t.string :slug
    end
  end
end
