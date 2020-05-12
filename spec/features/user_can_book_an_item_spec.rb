require 'rails_helper'

RSpec.describe "User can book an item" do
  let!(:item) { create(:item) }
  start_date = (Date.today + 1.day)
  end_date = (Date.today + 3.day)

  it "can book an item", js: true do
    visit items_path
    counter = Booking.count

    within "#item-#{item.id}" do
      click_on "réserver"
    end

    fill_in "booking[user]", with: 'Julien'

    within ".dayContainer" do
      find("span[aria-label='#{start_date.strftime("%B %e, %Y")}']").click
      find("span[aria-label='#{end_date.strftime("%B %e, %Y")}']").click
    end

    click_on "Réserver"

    expect(Booking.count).to eq(counter + 1)

    expect(page).to have_content("Julien")
    expect(page).to have_content("#{start_date}")
    expect(page).to have_content("#{end_date}")
  end
end
