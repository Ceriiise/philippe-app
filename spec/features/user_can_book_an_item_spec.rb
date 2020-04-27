require 'rails_helper'

RSpec.describe "User can book an item" do
  let!(:item) { create(:item) }

  it "can book an item" do
    visit items_path
    counter = Booking.count

    within "#item-#{item.id}" do
      click_on "réserver"
    end

    fill_in "booking[user]", with: 'Julien'
    select '2020-04-13', from: "booking_start_date"

    select '2020', from: "booking_end_date_1i"
    select 'April', from: "booking_end_date_2i"
    select '30', from: "booking_end_date_3i"

    click_on "Réserver"

    expect(Booking.count).to eq(counter + 1)

    expect(page).to have_content("Julien")
    expect(page).to have_content("2020-04-24")
    expect(page).to have_content("2020-04-30")
  end
end
