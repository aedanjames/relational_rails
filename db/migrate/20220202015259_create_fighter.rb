class CreateFighter < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.float :height
      t.float :weight
      t.integer :reach
      t.string :stance
      t.boolean :active
    end
  end
end
