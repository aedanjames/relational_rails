class CreateOrganization < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :name
      t.integer :year_founded
      t.string :president
      t.boolean :international
    end
  end
end
