class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities, except: [:created_at, :updated_at]
    end


    def destroy
        activity = Activity.find_by!(id: params[:id])
        if activity
            activity.destroy
        else 
            render error: "Activity not found", status: :not_found
        end
    end
end
