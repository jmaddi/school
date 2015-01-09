require 'rails_helper'

RSpec.describe Api::StudentsController, :type => :controller do

  describe "GET index" do
    it 'returns students from external services' do
      stub_request(:get, "https://s3-ap-southeast-2.amazonaws.com/teremstudents/students.json").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(
          status: 200,
          headers: { 'Content-Type' =>  'text/json' },
          body: { 'Students' => [
            { 'id' => 'CP001', 'name' => 'Paul Frank' },
            { 'id' => 'CP002', 'name' => 'Tony Jones' }
          ] }.to_json
        )

      get :index

      json = JSON.parse(response.body)
      expect(json.count).to be 2
      expect(json[0]['id']).to eq 'CP001'
    end
  end

end
