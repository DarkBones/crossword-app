class <%= class_name %>Generator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_files
    template '<%= file_name %>.rb', "app/#{file_name.pluralize}/#{file_name}.rb"
  end
end
