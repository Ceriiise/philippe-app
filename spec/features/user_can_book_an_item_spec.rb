require 'rails_helper'

RSpec.describe "User can book an item" do
  let!(:item) { create(:item) }

  it "can book an item", js: true do
    visit items_path
    counter = Booking.count

    within "#item-#{item.id}" do
      click_on "réserver"
    end

    fill_in "booking[user]", with: 'Julien'

    within ".dayContainer" do
      find('span[aria-label="April 27, 2020"]').click
      find('span[aria-label="April 30, 2020"]').click
    end

    click_on "Réserver"

    expect(Booking.count).to eq(counter + 1)

    expect(page).to have_content("Julien")
    expect(page).to have_content("2020-04-27")
    expect(page).to have_content("2020-04-30")
  end
end
