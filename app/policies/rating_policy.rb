class RatingPolicy
    attr_reader :current_user, :model

    def initialize(current_user, model)
        @current_user = current_user
        @link = model
    end

    def rate?
        !@current_user.nil?
    end
end