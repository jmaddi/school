class Api::StudentsController < ApplicationController
  def index
    response = HTTParty.get('https://s3-ap-southeast-2.amazonaws.com/teremstudents/students.json')
    render json: JSON.parse(response.body)['Students']
  end
end
