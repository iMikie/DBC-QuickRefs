require 'spec_helper'

describe User do

  # def bob
  #   @bob ||= User.new(
  #     username: '',
  #     email: 'bob@bob.com'
  #   )
  # end

  let(:bob){
    User.new(
        username: '',
        email: 'bob@bob.com'
    )
  }

  let(:sam){
    User.new(
        username: 'sam',
        email: 'sam@sam'
    )
  }

  before do
    @bob = User.new(
        username: '',
        email: 'bob@bob.com'
    )

    @sam = User.new(
        username: 'sam',
        email: 'sam@sam'
    )
  end


  it 'should validate that username is present' do
    expect(@sam.valid?).to eq false
  end

  it 'should validate that email is present' do
    expect(@bob.valid?).to eq false
  end

  context 'when the user is dead' do

    context 'from disentary' do

      before do
        create_user!
      end

      it 'something with lots of users' do




      end

    end

    context 'from a bullet' do

      it 'foo' do
        generate_username
        create_user!
      end



    end

  end


end












describe 'index controller' do

  describe 'GET /' do

    before do
      urls = 5.times.map do |n|
        Url.create!(original: "http://#{n}.com", shortened: "pants#{n}")
      end
    end

    it 'should render all the urls' do
      get '/'
      expect(last_response.status).to eq 200
      expect(last_response.content_type).to start_with 'text/html'

      urls.each do |url|
        expect(last_response.body).to include url.original
        expect(last_response.body).to include "href=\"http://example.org/#{url.shortened}\""
      end

    end

    it 'asdsada' do
    end

  end

  describe 'POST /links' do
    it 'should create a url record and redirect to /' do

      url = 'http://fark.com/awesome'

      expect{ post '/links', original: url }.to change{ Url.count }.by(1)

      expect(last_response.status).to eq 302
      expect(last_response.location).to eq 'http://example.org/'
      expect(last_response.content_type).to start_with 'text/html'

    end
  end

end
