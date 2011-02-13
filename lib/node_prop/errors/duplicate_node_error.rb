module NodeProp
  module Errors
    # Raised when a node insertion is attempted into a graph where that node
    # is already present
    # @example Throw this error
    #   graph = NodeProp::Graph.new
    #   node = NodeProp::Node.new
    #   graph.add_node!(node) #=> Returns graph
    #   graph.add_node!(node) # Raises DuplicateNodeError
    class DuplicateNodeError < Error
    end
  end
end
