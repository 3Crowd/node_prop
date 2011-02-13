module NodeProp
  module Errors
    # Raised when an index attachment is attempted when the given index is already
    # attached to the given graph instance
    # @example Throw this error
    #   graph = NodeProp::Graph.new
    #   index = NodeProp::Index.new
    #   graph.add_index!(index) #=> Graph instance
    #   graph.add_index!(index) #=> Raises DuplicateIndexError
    class DuplicateIndexError < Error
    end
  end
end
