module ApplicationHelper
  def render_component(component_name, locals = {}, &block)
    name = component_name.split("_").first
    render("components/#{name}/#{component_name}", locals, &block)
  end

  def form_errors_for(objects)
    render partial: 'layouts/form_errors', locals: { object: objects }
  end

  def placeholder_if_blank(value)
    return '~' if value.blank?
    value
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + '_fields', f: builder)
    end
    link_to(name, '#', class: 'add_fields button is-link', data: {id: id, fields: fields.gsub("\n", '')})
  end
end
