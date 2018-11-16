module ApplicationHelper
  def render_component(component_name, locals = {}, &block)
    name = component_name.split("_").first
    render("components/#{name}/#{component_name}", locals, &block)
  end

  def placeholder_if_blank(value)
    return '~' if value.blank?
    value
  end
end
