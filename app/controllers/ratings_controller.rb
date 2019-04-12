class RatingsController < ApplicationController
    after_action :verify_authorized
    respond_to :js, :html

    def rate
        authorize Rating
        @user = current_user
        @link = Link.find(params[:link_id])
        @previous_value = ""

        @rating = @link.ratings.find_or_initialize_by(user_id: @user.id) do |rating|
            rating.value = rating_params.values.first.to_i
            rating.user_id = @user.id
        end

        if @rating.new_record?
            if !@rating.save
                @previous_value = "new record"
            end
        else
            @previous_value = @rating.value
            if @rating.update(value: rating_params.values.first.to_i)
                @previous_value = ""
            end
        end
        respond_to do |format|
            format.js 
            format.html { redirect_to link_path(@link) }
        end
    end
    private
        # Never trust parameters from the scary internet, only allow the white list through.
        def rating_params
            params.require(:rating).permit(:value, :link_id)
        end
end
