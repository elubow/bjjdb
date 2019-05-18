class SearchController < ApplicationController
  before_action :force_json, only: [:autocomplete, :tags_for]

  def autocomplete
    @tags = Tag.ransack(full_tag_cont: params[:q]).result(distinct: true).limit(5)
    @links = Link.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
    @instructors = Instructor.ransack(all_names_cont: params[:q]).result(distinct: true).limit(5)
  end

  def tags_for
    @tags = case params[:iwant]
    when 'escape', 'defend', 'counter', 'learn', 'flow'
      Tag.position_submission
    when 'submit', 'pass'
      Tag.positions
    else
      Tag.all
    end
  end

  def input
    render 'new' if params[:q].blank? or params[:q].length < 2
    @tags = Tag.ransack(full_tag_cont: params[:q]).result(distinct: true)
    @links = Link.ransack(title_cont: params[:q]).result(distinct: true).order(created_at: :desc)
    @instructors = Instructor.ransack(all_names_cont: params[:q]).result(distinct: true)
    @private_notes = if current_user
                       PrivateNote.where(user_id: current_user.id).ransack(
        body_cont: params[:q],
        title_cont: params[:q],
        m: 'or'
    ).result(distinct: true)
                     else
                       []
                     end
    @total_results = @links.size + @tags.size + @instructors.size + @private_notes.size
  end

  def advanced
    @links = params[:tag_ids] ?
      Link.by_tags(params[:tag_ids]).ransack(title_cont: params[:q]).result(distinct: true).order(created_at: :desc) :
      Link.ransack(title_cont: params[:q]).result(distinct: true).order(created_at: :desc)
    
    @tags = []
    @instructors = []
    @total_results = @links.count
    render 'input'
  end

  private

    def force_json
      request.format = :json
    end
end
