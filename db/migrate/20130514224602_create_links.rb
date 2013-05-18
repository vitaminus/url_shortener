class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :full_link
      t.string :short_link
      t.integer :counter, default: 0
      t.boolean :private
      t.string :password

      t.timestamps
    end
  end
end
