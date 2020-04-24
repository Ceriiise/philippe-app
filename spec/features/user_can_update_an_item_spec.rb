require 'rails_helper'

RSpec.describe "User can update an item" do
  let!(:item) { create(:item) }

  it "can update an item" do
    visit edit_item_path(item)

    fill_in "item[name]", with: 'table'
    fill_in "item[description]", with: 'la belle table'
    click_on "Enregistrer"

    expect(page).to have_content("table")
    expect(page).to have_content("la belle table")
  end
end
