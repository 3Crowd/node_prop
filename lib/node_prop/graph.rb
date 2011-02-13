require 'node_prop/errors/duplicate_node_error'
require 'node_prop/errors/duplicate_index_error'
require 'node_prop/errors/invalid_node_membership_error'
require 'node_prop/errors/invalid_index_membership_error'

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
      @nodes = []
      @indexes = []
    end
    
    # Make the specified Node a member of this graph instance
    # @param [ NodeProp::Node ] node_to_add The node to make a member of the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    # @raise [ NodeProp::Errors::DuplicateNodeError ] Raised if the node_to_add is already a member of the graph instance
    def add_node! node_to_add
      raise Errors::DuplicateNodeError if has_node? node_to_add
      nodes << node_to_add
      return self
    end
    
    # Query for the presence of a node in the graph
    # @param [ NodeProp::Node ] node_for_which_to_query_for_presence The node which you want to check for the presence of within the graph
    # @return [ Boolean ] Whether or not the specified node is present within the graph
    def has_node? node_for_which_to_query_for_presence
      nodes.include? node_for_which_to_query_for_presence
    end
    
    # Remove the specified Node from this graph instance
    # @param [ NodeProp::Node ] node_to_remove The node to remove from the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    # @raise [ NodeProp::Errors::InvalidNodeMembershipError ] Raised if the node_to_remove is not a member of the graph instance
    def remove_node! node_to_remove
      raise Errors::InvalidNodeMembershipError unless has_node? node_to_remove
      nodes.delete node_to_remove
      return self
    end
    
    # Query for the presence of an index in the graph
    # @param [ NodeProp::Index ] index_for_which_to_query_for_presence The index which you want to check for the attachment of on the graph
    # @return [ Boolean ] Whether or not the specified index is present within the graph
    def has_index? index_for_which_to_query_for_presence
      indexes.include? index_for_which_to_query_for_presence
    end
    
    # Associate the specified Index with this graph instance
    # @param [ NodeProp::Index ] index_to_add The index to associate with the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    # @raise [ NodeProp::Errors::DuplicateIndexError ] Raised if the index_to_add is already attached to the graph instance
    def add_index! index_to_add
      raise Errors::DuplicateIndexError if has_index?(index_to_add)
      indexes << index_to_add
      return self
    end
    
    # Disassociate the specified Index with this graph instance
    # @param [ NodeProp::Index ] index_to_remove The index to disassociate from the receiving Graph
    # @return [ NodeProp::Graph ] The graph being modified (self)
    # @raise [ NodeProp::Errors::InvalidIndexMembershipError ] Raised if index_to_remove is not attached to the graph instance
    def remove_index! index_to_remove
      raise Errors::InvalidIndexMembershipError unless has_index?(index_to_remove)
      indexes.delete index_to_remove
      return self
    end
    
  end
  
end
