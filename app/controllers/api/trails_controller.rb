class Api::TrailsController < ActionController::API
  def index
    render json: Trail.where('name LIKE ?', "%#{params[:query]}%").pluck(:name)
  end
end