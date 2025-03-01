class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: resource, status: :ok
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def json_request?
    request.format.json?
  end
end
