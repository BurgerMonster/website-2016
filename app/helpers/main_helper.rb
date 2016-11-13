module MainHelper
  def form_classes(key)
    if @contact.errors[key].any?
      { class: "form-group has-error has-feedback" }
    else
      { class: "form-group" }
    end
  end
end
