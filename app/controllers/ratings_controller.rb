class RatingsController < ApplicationController
    after_action :verify_authorized
    def rate
        authorize Rating
        @user = current_user
        @link = Link.find(params[:link_id])

        @rating = @link.ratings.find_or_initialize_by(user_id: @user.id) do |rating|
            rating.value = rating_params.values.first.to_i
            rating.user_id = @user.id
        end

        if @rating.new_record?
            if @rating.save
                flash[:notice] = "Rating saved!"
            else
                flash[:notice] = "There was a problem trying to save your rating!"
            end
        else
            if @rating.update(value: rating_params.values.first.to_i)
                flash[:notice] = "Rating updated!"
            else
                flash[:notice] = "There was a problem trying to updating your rating!"
            end
        end
        redirect_to link_path(@link)
    end

    private

        # Never trust parameters from the scary internet, only allow the white list through.
        def rating_params
            params.require(:rating).permit(:value, :link_id)
        end
end
