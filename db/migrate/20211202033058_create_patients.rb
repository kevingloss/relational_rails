class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age_in_months
      t.boolean :full_term_birth
      t.references :pediatrician, foreign_key: true

      t.timestamps
    end
  end
end
