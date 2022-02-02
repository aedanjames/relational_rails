class CreateHotel < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :five_stars
      t.integer :year_founded
    end
  end
end
