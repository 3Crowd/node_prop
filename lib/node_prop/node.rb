require 'active_support/concern'

module NodeProp
  
  # Represents an atom within the graph, a particular instance of a PropertySet
  module Node
    include ActiveSupport::Concern
    
    # Defines class methods that will be defined on the including class according
    # to the behavior of the ActiveSupport::Concern module
    module ClassMethods
    end
    
    # Defines instance methods that will be defined on the including class according
    # to the behavior of the ActiveSupport::Concern module
    module InstanceMethods
    end
    
  end
end
