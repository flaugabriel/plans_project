class ApiController < ApplicationController
  def json_error_response(messenger, status)
    render json: { messenger: messenger, status: status }
  end
end