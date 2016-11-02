require 'rails_helper'

RSpec.describe 'Items API Controller' do
  it 'can return a list of all items' do

    item = create :item
    10.times do
      create :item
    end

    get '/api/v1/items'

    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json.length).to eq(11)
    expect(json.class).to eq(Array)
    expect(json.first['id']).to eq(item.id)
    expect(json.first['name']).to eq(item.name)
    expect(json.first['description']).to eq(item.description)
    expect(json.first['image_url']).to eq(item.image_url)
    expect(json.first['created_at']).to eq(item.created_at)
  end

  it 'can return info for one item' do

    item = create :item
    10.times do
      create :item
    end

    get "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json.class).to eq(Hash)
  end

  it 'can delete one item with requested params' do

    item = create :item
    10.times do
      create :item
    end

    delete "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body)

    # expect(response.status).to eq(204)
    expect(json.class).to eq(Array)
    expect(json.length).to eq(10)
  end

  it 'can post one item with requested params' do

    10.times do
      create :item
    end

    post "/api/v1/items?name=Matt&description=shortdescription&image_url=httpwebsite"

    json = JSON.parse(response.body)

    # expect(response.status).to eq(201)
    expect(json.class).to eq(Hash)
    expect(json['name']).to eq('Matt')
    expect(json['description']).to eq('shortdescription')
    expect(json['image_url']).to eq('httpwebsite')
  end
end
