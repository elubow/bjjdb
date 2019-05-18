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
    tags_to_search = params[:tag_ids] + pajama_status

    case params[:iwant]
    when 'counter'
      # FIXME should include escape and defend
      counter = Tag.where(full_name: 'move::counter').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, counter].flatten).order(created_at: :desc), items: 25)
    when 'escape'
      # FIXME should include counter and defend
      escape = Tag.where(full_name: 'move::escape').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, escape].flatten).order(created_at: :desc), items: 25)
    when 'submit'
      submission = Tag.where(full_name: 'move::submission').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, submission].flatten).order(created_at: :desc), items: 25)
    when 'drill'
      drill = Tag.where(full_name: 'move::drill').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, drill].flatten).order(created_at: :desc), items: 25)
    when 'defend'
      # FIXME should include counter and escape
      defense = Tag.where(full_name: 'move::defense').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, defense].flatten).order(created_at: :desc), items: 25)
    when 'learn'
      # FIXME should include move::drill
      learn = Tag.where(full_name: 'move::theory').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, learn].flatten).order(created_at: :desc), items: 25)
    when 'flow'
      # FIXME should include move::warmup
      flow = Tag.where(full_name: 'move::flow').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, flow].flatten).order(created_at: :desc), items: 25)
    when 'pass'
      pass = Tag.where(full_name: 'move::pass').limit(1).first.id
      @pagy, @links = pagy(Link.by_tags([tags_to_search, pass].flatten).order(created_at: :desc), items: 25)
    else
      # we should never get here, but let's run a search just in case
      @pagy, @links = pagy(Link.by_tags([tags_to_search].flatten).order(created_at: :desc), items: 25)
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
