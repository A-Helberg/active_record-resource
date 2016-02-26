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
            unless child_class == ActiveRecord::SchemaMigration
              child_class.class_eval do
                def self.new(*args)
                  check_resource_methods

                  super(*args)
                end

                def handle_delete
                  resource_delete_validations
                  if self.errors.present?
                    return false
                  end
                  return resource_delete
                end
              end

              child_class.instance_eval do
                # Add Hooks
                before_create :resource_create
                before_validation(:resource_create_validations, on: :create)

                before_update :resource_update
                before_validation(:resource_update_validations, on: :update)

                before_destroy :handle_delete
              end
            end

            super
          end



          def self.check_resource_methods
            raise not_creatable_error unless method_defined? :resource_create
            raise no_creation_validations_error unless method_defined? :resource_create_validations

            raise not_deletable_error unless method_defined? :resource_delete
            raise no_deletable_validations_error unless method_defined? :resource_delete_validations

            raise not_updatable_error unless method_defined? :resource_delete
            raise no_updatable_validations_error unless method_defined? :resource_delete_validations
          end

          def self.not_creatable_error
            "The model #{self} is createable, but does not implement #resource_create"
          end

          def self.no_creation_validations_error
            "The model #{self} is createable, but does not implement #resource_create_validations"
          end

          def self.not_deletable_error
            "The model #{self} is deletable, but does not implement #resource_delete"
          end

          def self.no_deletable_validations_error
            "The model #{self} is deletable, but does not implement #resource_delete_validations"
          end

          def self.not_updatable_error
            "The model #{self} is updatable, but does not implement #resource_update"
          end

          def self.no_updatable_validations_error
            "The model #{self} is updatable, but does not implement #resource_update_validations"
          end
        end
      end

    end
  end
end
