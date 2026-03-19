class ApplicationController < ActionController::API
  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers["Authorization"]
    @current_user = User.find_by(auth_token: token)
    render json: { error: "No autorizado" }, status: :unauthorized unless @current_user
  end
end
