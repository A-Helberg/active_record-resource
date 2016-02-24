module ActiveRecord
  module Resource
    module Callbacks
      # When this module is included, which it is done by default
      def self.included(base)
        # Exetend AR::Base
        base.class_eval do
          # When a class inherits from AR::Base, all models do
          def self.inherited(child_class)
            # On the class that Inherits AR::Base
            child_class.class_eval do
               def self.new(*args)
                 check_resource_methods

                 super(*args)
               end
            end

            super
          end

          # Add Hooks
          before_create :resource_create
          before_validation(:resource_create_validations, on: :create)

          def self.check_resource_methods
            raise not_creatable_error unless method_defined? :resource_create
            raise no_creation_validations_error unless method_defined? :resource_create_validations
          end

          def self.not_creatable_error
            "The model #{self} is createable, but does not implement #resource_create"
          end

          def self.no_creation_validations_error
            "The model #{self} is createable, but does not implement #resource_create_validations"
          end
        end
      end

    end
  end
end
