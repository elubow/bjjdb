module SearchHelper
  def display_search_parameters(result_count, params)
    # Add the below code to this
 ####     <% if @total_results > 0 %>
 ####       <h2 class="lead"><strong class="text-danger"><%= @total_results %></strong> results were found for the search for <%= display_search_parameters(params) %></h2>
 ####     <% else %>
 ####       <h2 class="lead">No results found for <strong class="text-danger"><%= params[:q] %></strong></h2>
 ####     <% end %>

    rv = '<h2 class="lead">' + pluralize(result_count, "result") + '</h2>'

    if params[:q]
      rv = rv + "<h2 class='lead'>Term: <strong class='text-danger'>#{params[:q]}</strong></h2>"
    end

    if params[:tag_ids].present? and params[:tag_ids].length > 0
      rv = rv + "<h2 class='lead'>Tags: "
      Tag.where(id: params[:tag_ids]).each do |tag|
        rv = rv + link_to(tag.full_name, tag, class: 'tag')
      end
      rv = rv + "</h2>"
    end
    rv.html_safe
  end
end
