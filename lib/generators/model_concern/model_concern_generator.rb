class ModelConcernGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_files
    template 'model_concern.rb', "app/models/concerns/#{file_name}.rb"
  end
end
