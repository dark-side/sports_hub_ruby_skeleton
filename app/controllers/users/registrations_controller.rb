class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  skip_before_action :verify_authenticity_token, if: :json_request?

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { id: resource.id, email: resource.email }, status: :created
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def json_request?
    request.format.json?
  end

  def sign_up_params
    if params[:user].present?
      params.require(:user).permit(:email, :password, :password_confirmation)
    elsif params[:registration].present?
      params.require(:registration).permit(:email, :password, :password_confirmation)
    else
      params.permit(:email, :password, :password_confirmation)
    end
  end
end
