class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.float :rating
      t.boolean :read

      t.timestamps
    end
  end
end
