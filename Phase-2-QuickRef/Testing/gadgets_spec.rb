require 'spec_helper'

describe "GET /gadgets" do

  before do
    @a = Gadget.create(name: "name1", body: "body")
    @b = Gadget.create(name: "name2", body: "body")
    @c = Gadget.create(name: "name3", body: "body")
  end

  it "should display all gadgets" do

    get "/gadgets"

    expect(last_response.status).to eq 200
    expect(last_response.content_type).to start_with 'text/html'
    expect(last_response.body).to include @a.name
    expect(last_response.body).to include @b.name
    expect(last_response.body).to include @c.name

  end
end

describe 'POST /gadgets' do
  context "when the request has valid paramters" do
    it "creates a new gadget" do
      post '/gadgets', name: 'somename', body: "somebody"
      expect(last_response.status).to eq 302
    end
    it "redirects the user to the /gadgets route" do
      post '/gadgets', name: 'somename', body: "somebody"
      expect(last_response.location).to eq "http://example.org/gadgets"
    end
  end

  context "when the request does not include a body value" do
    it "does not create a new gadget" do
      post '/gadgets', name: "thing", body: ""
      expect(last_response.status).to eq 422
    end
    it "returns a status code of 422" do
      post '/gadgets', name: "thing", body: ""
      expect(last_response.status).to eq 422
    end
  end

  context "when the request does not include a unique name value" do
    before do
      Gadget.create!(name: "frog", body: "ribbet")
    end
    it "does not create a new gadget" do
      expect{
        post '/gadgets', name: "frog", body: "ribbet"
      }.to_not change{ Gadget.count }
    end
    it "returns a status code of 422" do
      post '/gadgets', :name => "frog", body: "ribbet"
      expect(last_response.status).to eq 422
    end
  end
end