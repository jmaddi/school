class Api::StudentsController < ApplicationController
  def index
    url = Rails.configuration.external_student_url
    response = HTTParty.get(url)
    render json: JSON.parse(response.body)['Students']
  end
end
