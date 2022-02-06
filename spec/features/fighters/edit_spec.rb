require 'rails_helper'
# As a visitor
# When I visit a fighter Show page
# Then I see a link to update that fighter "Update fighter"
# When I click the link
# I am taken to '/fighters/#{fighter.id}/edit' where I see a form to edit the fighter's attributes:
# When I click the button to submit the form "Update fighter"
# Then a `PATCH` request is sent to '/fighters/:id',
# the fighter's data is updated,
# and I am redirected to the fighter Show page where I see the fighter's updated information
RSpec.describe 'update fighter' do 

it 'can navigate the user to an update form' do 
    organization = Organization.create!(name: "Rollie Pollie", year_founded: 1994, president: "Bam Bam", international: true)
    fighter = organization.fighters.create!(name: "Rocky", height: 4.0, weight:190.0, reach: 36, stance: "switch", active: false)
    visit "/fighters/#{fighter.id}"
    click_link "Update Rocky"
    expect(current_path).to eq("/fighters/#{fighter.id}/edit")
end 
end