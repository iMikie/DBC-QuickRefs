require 'spec_helper'

describe 'GET /widgets' do
  before do
    @bob = User.create!
    @sam = User.create!
    6.times do |n|
      user = n > 2 ? @sam : @bob
      Widget.create!(title: "widget ##{n}", content: n, user: user)
    end
  end
  context "when a user is not logged in" do
    it "displays all widgets" do
      get '/widgets'
      expect(last_response.body).to include 'widget #0'
      expect(last_response.body).to include 'widget #1'
      expect(last_response.body).to include 'widget #2'
      expect(last_response.body).to include 'widget #3'
      expect(last_response.body).to include 'widget #4'
      expect(last_response.body).to include 'widget #5'
    end
  end

  context "when a user is logged in" do
    it "displays all of the given user's widgets" do
      get '/widgets', {}, {'rack.session' => {user_id: @bob.id}}
      expect(last_response.body).to include 'widget #0'
      expect(last_response.body).to include 'widget #1'
      expect(last_response.body).to include 'widget #2'

      # expect(last_response.body).to include @widgets = current_user.widgets
    end
    it "does not display other users' widgets" do
      get '/widgets', {}, {'rack.session' => {user_id: @bob.id}}
      expect(last_response.body).to_not include 'widget #3'
      expect(last_response.body).to_not include 'widget #4'
      expect(last_response.body).to_not include 'widget #5'
    end
  end
end
