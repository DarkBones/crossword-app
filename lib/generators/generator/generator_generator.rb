class GeneratorGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_files
    template 'generator.rb', "lib/generators/#{file_name}/#{file_name}_generator.rb"
    template 'class.rb', "lib/generators/#{file_name}/templates/#{file_name}.rb"
  end
end
