# require_relative "active_record/resource/callbacks.rb"
require "active_record/resource/callbacks"

module ActiveRecord
  module Resource
    class Engine < Rails::Engine
      initializer "engine.initialize" do
        if defined?(ActiveRecord::Base)
          ActiveRecord::Base.send(:include, Callbacks)
        end
      end

    end
  end
end
