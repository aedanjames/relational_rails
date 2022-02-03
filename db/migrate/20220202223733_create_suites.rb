class CreateSuites < ActiveRecord::Migration[5.2]
  def change
    create_table :suites do |t|
      t.string :name
      t.boolean :clean
      t.integer :number_of_beds
      t.datetime :created_at
      t.datetime :updated_at
      t.references :hotel, foreign_key: true
    end
  end
end
