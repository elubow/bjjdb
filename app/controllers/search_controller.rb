class SearchController < ApplicationController
  before_action :force_json, only: :autocomplete

  def autocomplete
    @tags = Tag.ransack(full_tag_cont: params[:q]).result(distinct: true).limit(5)
    @links = Link.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
  end

  def input
    @tags = Tag.ransack(full_tag_cont: params[:q]).result(distinct: true)
    @links = Link.ransack(title_cont: params[:q]).result(distinct: true)
  end

  private

    def force_json
      request.format = :json
    end
end
