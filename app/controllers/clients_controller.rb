class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #GET /clients/:id
    def show
        client = Client.find_by(id: params[:id])
        render json: client
    end

    private

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end

end
