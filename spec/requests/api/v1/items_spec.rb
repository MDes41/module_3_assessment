require 'rails_helper'

RSpec.describe 'Items API Controller' do
  it 'can return a list of all items' do

    10.times do
      create :item
    end

    get '/api/v1/items'

    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json.length).to eq(10)
    expect(json.class).to eq(Array)
  end

  it 'can return info for one item' do

    item = create :item
    10.times do
      create :item
    end

    get "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json.class).to_not eq(Array)
  end

  it 'can delete one item with requested params' do

    item = create :item
    10.times do
      create :item
    end

    delete "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body)

    expect(response.status).to eq(204)
    expect(json.class).to eq(Array)
    expect(json.length).to eq(10)
  end
end
