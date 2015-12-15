require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module News
    module Backend
      module Configuration
        def configure
          yield self
        end

        mattr_accessor :base_controller_descendants do
          []
        end
      end
    end
  end
end