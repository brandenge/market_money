class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved, with: :not_saved

  private

  def not_found(error)
    render json: ErrorSerializer.new(error).format_error, status: :not_found
  end

  def not_saved(error)
    render json: ErrorSerializer.new(error).format_error, status: :bad_request
  end
end
