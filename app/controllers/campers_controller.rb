class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, except: [:created_at, :updated_at]
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        if camper
            render json: camper, except: [:created_at, :updated_at]
        else
            render error: "Camper not found", status: :not_found

        end

    end

    def create
        camper = Camper.create!(create_allowable)
        if camper
            render json: camper, except: [:created_at, :updated_at]
        else
            render error: "validation errors"
        end 

    end



    private 

    def create_allowable
        params.require(:camper).permit(:name, :age)
    end


end
