require 'rails_helper'

RSpec.describe "User can delete an item" do
  let!(:item) { create(:item) }

  it "can delete an item" do
    counter = Item.count

    visit items_path

    within "#item-#{item.id}" do
      click_on(class: 'delete-item')
    end

    expect(Item.count).to eq(counter - 1)
  end
end
