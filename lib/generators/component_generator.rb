class ComponentGenerator < Rails::Generators::Base
  argument :component_name, required: true, desc: "Component name, e.g: button"

  def create_view_file
    create_file "#{component_path}/_#{component_name}.html.erb"
  end

  def create_css_file
    create_file "#{component_path}/#{component_name}.scss"
  end

  def create_js_file
    create_file "#{component_path}/#{component_name}.js" do
      "import \"./#{component_name}.scss\";\n"
    end
  end

  def require_component
    File.open(init_path, 'a') do |file|
      file.puts "\nimport '../components/#{component_name}/#{component_name}'"
    end
  end

  protected

  def component_path
    "app/javascript/components/#{component_name}"
  end

  def init_path
    'app/javascript/init/index.js'
  end
end
