module ApplicationHelper
  def title_tag
    content_tag(:title, [content_for(:title), "Burger Monster"].compact.join(" | "))
  end

  def description_tag
    tag(:meta, name: "description", content: content_for(:description)) if content_for?(:description)
  end

  def page_identifiers
    name = params[:action].gsub("_", "-")
    { class: name, id: name }
  end

  def copyright_date
    ["2011", Date.current.year.to_s].uniq.join(" - ")
  end
end
