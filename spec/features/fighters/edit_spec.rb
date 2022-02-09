require 'rails_helper'

RSpec.describe 'update fighter' do 

it 'can navigate the user to an update form' do 
    organization = Organization.create!(name: "Rollie Pollie", year_founded: 1994, president: "Bam Bam", international: true)
    fighter = organization.fighters.create!(name: "Rocky", height: 4.0, weight:190.0, reach: 36, stance: "switch", active: false)
    visit "/fighters/#{fighter.id}"
    click_link "Update Rocky"
    expect(current_path).to eq("/fighters/#{fighter.id}/edit")
    end
    
it 'can successfully update a fighter' do
    organization = Organization.create!(name: "Rollie Pollie", year_founded: 1994, president: "Bam Bam", international: true)
    fighter = organization.fighters.create!(name: "Rcky", height: 4435.0, weight: 190.0, reach: 36, stance: "switch", active: false)
    visit "/fighters/#{fighter.id}"
    expect(page).to have_content("Rcky")
    visit "/fighters/#{fighter.id}/edit"
    fill_in 'name', with: "Rocky"
    fill_in 'height', with: "2.1"
    click_button "Update Fighter"
    expect(current_path).to eq("/fighters/#{fighter.id}")
    expect(page).to have_content("Rocky")
    end
end