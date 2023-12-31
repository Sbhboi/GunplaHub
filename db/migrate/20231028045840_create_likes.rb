class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :likable, polymorphic: true, null: false
      t.references :user, null: false
      t.timestamps
    end

    add_foreign_key :likes, :users
    add_index :likes, [:likable_id, :likable_type]
  end
end