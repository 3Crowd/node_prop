module NodeProp
  
  # Represents a collection of nodes and controls their mutation along with
  # the mutation of their property sets
  class Graph
    
    # The node objects which belong to this graph
    attr_reader :nodes
    
    # Construct the Graph object
    def initialize
      super
      @nodes = []
    end
    
  end
  
end
