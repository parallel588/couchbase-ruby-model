require 'rails/generators/couchbase_generator'

module Couchbase
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      desc 'Creates a couchbase model'

      argument :name, :type => :string
      argument :attributes, :type => :array, :default => [], :banner => "field field"

      check_class_collision

      def self.source_root
        @_couchbase_source_root ||= File.expand_path('../templates', __FILE__)
      end

      def create_model_file
        template 'model.rb', File.join('app', 'models', class_path, "#{file_name}.rb")
      end

      def create_module_file
        return if class_path.empty?
        template 'module.rb', File.join('app', 'models', "#{class_path.join('/')}.rb") if behavior == :invoke
      end

      hook_for :test_framework

      protected

      def parent_class_name
        "Couchbase::Model"
      end

    end
  end
end
