require 'rails/generators/couchbase_generator'

module Couchbase
  module Generators
    class ModelGenerator < Rails::Generators::Base

      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      def create_module_file
        return if class_path.empty?
        template 'module.rb', File.join('app/models', "#{class_path.join('/')}.rb") if behavior == :invoke
      end

      protected

      def parent_class_name
        "Couchbase::Model"
      end

    end
  end
end
