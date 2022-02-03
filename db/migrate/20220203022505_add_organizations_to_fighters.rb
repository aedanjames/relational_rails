class AddOrganizationsToFighters < ActiveRecord::Migration[5.2]
  def change
    add_reference :fighters, :organization, foreign_key: true
  end
end
