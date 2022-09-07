class SignupsController < ApplicationController

    def create
        signup = Signup.create!(create_allowable)
        if signup
            render json: signup, include: [:time, :camper_id, activity_id:[include: [:activities]] ]

        else
            render error: "validation errors"
        end 

    end



    private 

    def create_allowable
        params.require(:signup).permit(:time, :camper_id, :activity_id)
    end

end
