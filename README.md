# NodeProp (Node Property)
NodeProp, also known as np for short, is a unified 
application programming interface for arbitrary graph 
constructions. 

## In Development and Contributing
NodeProp is currently under development and as such most 
features described here are unimplemented. Please see the 
ROADMAP.md file for implementation progress. Contributions 
under the license described in LICENSE.md are most defintely welcome, 
please use the github fork/pull request featureset for patches.

## Graph Object API and NodeProp Object Schema

### Graph Object API
Examples of using the proposed Graph Object API below:

#### Setup
    graph = NodeProp::Graph.new
    property = NodeProp::Property.new(:name, String, :default => 'DefaultNodeName')
    property_set = NodeProp::PropertySet.new(property)
    node = NodeProp::Node.new(:property_set => property_set)

#### Adding Nodes to the Graph
    graph.add_node(node)

#### Removing a Node from a Graph
    graph.remove_node(node)

#### Adding an Index to a Graph
    index = NodeProp::Index.new( :type => :node, :key => :name )
    graph.add_index(index)

#### Mutating a PropertySet
    property_set.add_property :quantity, Integer, :default => 0
    property_set.remove_property :name

#### Mutating a Property Entry
    No interface has yet been decided on for mutating property entries.

### Object Schema/Primitives
The NodeProp schema is relatively constrained in order to
present the most flexible interface possible for graph
containment. With this concept in mind, the primitives with which
we will work are: Node, PropertySet, Index, Graph, Traveller,
and QueryEngine.

#### The Node
The Node primative represents an atom within the 
graph, essentially a particular instance of a PropertySet. 

#### The PropertySet
The PropertySet represents a collection of key-value pairs which 
describe the particular properties ascribed to a node or set of 
nodes. PropertySets are equal if all of their key-value pairs 
are equal.

#### The Index
The Index maintains a forward mapping from key-value pairs
in a nodes PropertySet to the list of nodes containing equal
key-values. For instance, given a set of nodes A and B with 
PropertySets Ap and Bp both containing namespaced key-value 
pairs of Ap{ns:test/key => 1}, Bp{ns:test/key => 1} than the
Index for ns:test/key would contain the values:
{ 1 => [A, B] }.

#### The Graph
The Graph coordinates the mutation of a named set of nodes and
PropertySets.

#### The Traveller
The Traveller encapsulates the operations required for traversing
the graph in the most efficient manor for the requirements given.

#### The QueryEngine
The QueryEngine provides an interface for specifying arbitrarily 
complex queries for a given graph in a standardized format. The
QueryEngine then creates a customized Traveller to execute the query.

## Persistence
Currently only for in-process in-memory graph structures, nodeprop 
does not provide any specific persistence mechanism. However, a 
persistence mechanism may be implemented by hooking into the 
provided Graph, Node, PropertySet, and Index modification 
and data-loading callbacks. See the project NodePropDB for
the NodeProp primary implementation of persistence once the project
has been started. 

## ACID Principles
ACID principles ( Atomicity, Consistency, Isolation, and Durability ) 
provide a certain set of guarantees for data stores. As a group, 
providing support for ACID guarantees is an early roadmap goal. 
Full support will likely depend on the backing store eventually 
implemented, and will remain optional so that any overhead introduced 
with those guarantees need not be experienced by those not requiring 
them.
