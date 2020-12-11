class ModelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_files
    template 'model.rb', "app/models/#{file_name}.rb"
    template 'migration.rb', "db/migrate/#{Time.now.utc.strftime('%Y%m%d%H%M%S')}_create_#{file_name.pluralize}.rb"
    template 'test.rb', "test/models/#{file_name}_test.rb"
  end
end
