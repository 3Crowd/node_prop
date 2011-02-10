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
    
    # Make the specified Node a member of this graph instance
    # @param [ NodeProp::Node ] node_to_add The node to make a member of the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    def add_node! node_to_add
      return self
    end
    
    # Remove the specified Node from this graph instance
    # @param [ NodeProp::Node ] node_to_remove The node to remove from the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    def remove_node! node_to_remove
      return self
    end
    
    # Associate the specified Index with this graph instance
    # @param [ NodeProp::Index ] index_to_add The index to associate with the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    def add_index! index_to_add
      return self
    end
    
    # Disassociate the specified Index with this graph instance
    # @param [ NodeProp::Index ] index_to_remove The index to disassociate from the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    def remove_index! index_to_remove
      return self
    end
    
  end
  
end
