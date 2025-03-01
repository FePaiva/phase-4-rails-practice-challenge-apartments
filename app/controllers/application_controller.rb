class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    private
  
    def render_not_found(e)
      render json: {error: "#{e.model} not found"}, status: :not_found
    end
  # gives an arrays of strings with all error messages created by active record of what went wrong.
    def render_unprocessable_entity_response(invalid)
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end


