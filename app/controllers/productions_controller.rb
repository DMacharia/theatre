class ProductionsController < ApplicationController
    wrap_parameters format: []

    #GET  /productions
    def index
        render json: Production.all, status: :ok
    end

    #GET  /productions/:id
    def show
        production = Production.find_by(id: params[:id])
        if production
            render json: production, status: :ok
        else
            render json: {error: "No such production"}, status: :not_found
        end
    end

    #POST /productions
    def create
        production = Production.create(production_params)
        render json: production, status: :created
    end

    private 

    def production_params
        params.permit(:title, :genre, :budget, :image, :director, :ongoing)
    end
end
