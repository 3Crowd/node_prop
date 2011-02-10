module NodeProp
  
  # Represents a collection of nodes and controls their mutation along with
  # the mutation of their property sets
  class Graph
    
    # A collection of nodes which belong to this graph
    attr_reader :nodes
    
    # A collection of indexes that are maintained for the nodes
    # in this graph
    attr_reader :indexes
    
    # Construct the Graph object
    def initialize
      super
      @nodes = []
      @indexes = []
    end
    
  end
  
end
