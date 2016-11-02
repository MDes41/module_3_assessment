require 'rails_helper'

RSpec.describe 'Items API Controller' do
  it 'can return a list of all items' do

    10.times do
      create :item
    end

    get '/api/v1/items'

    json = JSON.parse(response.body)

    # expect(response.status).to eq(200)
    save_and_open_page
    expect(page).to have_content()
  end
end
