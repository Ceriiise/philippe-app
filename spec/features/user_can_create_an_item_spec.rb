require 'rails_helper'

RSpec.describe "User can create an item" do
  it "can create an item" do
    visit items_path

    click_on "Ajouter un objet"
    fill_in "item[name]", with: 'chaise'
    fill_in "item[description]", with: 'la belle chaise'
    click_on "Enregistrer"

    expect(page).to have_content("chaise")
    expect(page).to have_content("la belle chaise")
  end
end
