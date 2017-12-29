class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :secret, :user
      t.timestamps null: false
    end
  end
end
