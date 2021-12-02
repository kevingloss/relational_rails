class CreatePediatricians < ActiveRecord::Migration[5.2]
  def change
    create_table :pediatricians do |t|
      t.string :name
      t.string :office
      t.integer :years_practicing
      t.boolean :accepting_patients

      t.timestamps
    end
  end
end
