module NodeProp
  module Errors
    # Raised when a node removal is attempted from a graph where that node
    # is not a member
    # @example Throw this error
    #   graph = NodeProp::Graph.new
    #   node = NodeProp::Node.new
    #   graph.remove_node!(node) # Raises InvalidNodeMembershipError
    class InvalidNodeMembershipError < Error
    end
  end
end
