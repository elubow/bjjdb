class SearchController < ApplicationController
  before_action :force_json, only: [:autocomplete, :tags_for]

  def autocomplete
    @tags = Tag.ransack(full_tag_cont: params[:q]).result(distinct: true).limit(5)
    @links = Link.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
    @instructors = Instructor.ransack(all_names_cont: params[:q]).result(distinct: true).limit(5)
  end

  def tags_for
    @tags = case params[:iwant]
    when 'escape', 'defend', 'counter', 'learn', 'flow', 'drill'
      Tag.position_submission
    when 'submit', 'pass'
      Tag.positions
    else
      Tag.all
    end
  end

  def targeted
    pajama_status = get_pajama_status(params[:gi], params[:nogi])
    tags_to_search = params[:tag_ids].present? ?
      [params[:tag_ids] + pajama_status].flatten :
      pajama_status

    want_tags = case params[:iwant]
    when 'counter', 'escape', 'defend'
      Tag.where(full_name: ['move::counter', 'move::escape', 'move::defense']).ids
    when 'submit'
      Tag.where(full_name: ['move::submission']).ids
    when 'drill', 'flow'
      Tag.where(full_name: ['move::drill', 'move::flow', 'move::warmup']).ids
    when 'learn'
      Tag.where(full_name: ['move::drill', 'move::theory']).ids
    when 'pass'
      Tag.where(full_name: ['move::pass', 'move::sweep']).ids
    else
      # we should never get here, but let's have tags just in case
      Tag.all
    end

    if params[:tag_ids].present?
      @pagy, @links = pagy(Link.joins(:tags).where("tags.id" => want_tags).by_tags(tags_to_search).order(created_at: :desc), items: 25)
    else
      if tags_to_search.empty?
        @pagy, @links = pagy(Link.joins(:tags).where("tags.id" => want_tags).distinct('links.id').order(created_at: :desc), items: 25)
      else
        # FIXME this query doesn't work properly. It needs to actually do an OR of tuples where the tuple is like (nogi, pass) OR (nogi, sweep) I think.
        @pagy, @links = pagy(Link.joins(:tags).where("tags.id" => want_tags).where("tags.id" => tags_to_search).distinct('links.id').order(created_at: :desc), items: 25)
      end
    end
  
    respond_to do |format|
      format.js
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

    def get_pajama_status(gi, nogi)
      if gi and !nogi
        return [Tag.where(full_name: 'uniform::gi').limit(1).ids]
      elsif !gi and nogi
        return [Tag.where(full_name: 'uniform::nogi').limit(1).ids]
      else
        return []
      end
    end
end
