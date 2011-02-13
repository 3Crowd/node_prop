module NodeProp
  module Errors
    # Raised when an index removal is attempted from a graph where that index
    # is not attached
    # @example Throw this error
    #   graph = NodeProp::Graph.new
    #   index = NodeProp::Index.new
    #   graph.remove_index!(index) # Raises InvalidIndexMembershipError
    class InvalidIndexMembershipError < Error
    end
  end
end
