class RatingPolicy
    attr_reader :current_user, :rating

    def initialize(current_user, rating)
        @current_user = current_user
        @rating = rating
    end

    def rate?
        !@current_user.nil?
    end
end