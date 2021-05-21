# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  private

  def not_found_response
    render status: :not_found, json: { message: "Record not found" }
  end
end
