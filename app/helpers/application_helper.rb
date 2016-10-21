module ApplicationHelper
  def page_identifiers
    name = params[:action].gsub("_", "-")
    { class: name, id: name }
  end
end
