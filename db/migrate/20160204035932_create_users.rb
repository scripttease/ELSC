class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:user) do |t|
      t.string :name
    end
  end
end
