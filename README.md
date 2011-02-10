# NodePropDB (Node Property Database)
NodePropDB, also known as npdb for short, is a unified 
application programming interface for arbitrary graph 
constructions. 

## In Development and Contributing
NodePropDB is currently under development and as such most 
features described here are unimplemented. Please see the 
ROADMAP.md file for implementation progress. Contributions 
under the license described in LICENSE.md are most defintely welcome, 
please use the github fork/pull request featureset for patches.

## Graph Interaction and NodePropDB Schema
The NodePropDB schema is relatively constrained in order to 
present the most flexible interface possible for graph 
containment. With this concept in mind, the primitives with which
we will work are: Node, PropertySet, Index, Graph, Traveller, 
and QueryEngine.
 
### The Node
The Node primative represents an atom within the 
graph, essentially a particular instance of a PropertySet. 

### The PropertySet
The PropertySet represents a collection of key-value pairs which 
describe the particular properties ascribed to a node or set of 
nodes. PropertySets are equal if all of their key-value pairs 
are equal.

### The Index
The Index maintains a forward mapping from key-value pairs
in a nodes PropertySet to the list of nodes containing equal
key-values. For instance, given a set of nodes A and B with 
PropertySets Ap and Bp both containing namespaced key-value 
pairs of Ap{ns:test/key => 1}, Bp{ns:test/key => 1} than the
Index for ns:test/key would contain the values:
{ 1 => [A, B] }.

### The Graph
The Graph coordinates the mutation of a named set of nodes and
PropertySets.

### The Traveller
The Traveller encapsulates the operations required for traversing
the graph in the most efficient manor for the requirements given.

### The QueryEngine
The QueryEngine provides an interface for specifying arbitrarily 
complex queries for a given graph in a standardized format. The
QueryEngine then creates a customized Traveller to execute the query.

## Persistence
Currently only for in-process in-memory graph structures, nodeprop 
does not provide any specific persistence mechanism. However, a 
persistence mechanism may be implemented by hooking into the 
provided Graph, Node, PropertySet, and Index modification 
and data-loading callbacks. 

## ACID Principles
ACID principles ( Atomicity, Consistency, Isolation, and Durability ) 
provide a certain set of guarantees for data stores. As a group, 
providing support for ACID guarantees is an early roadmap goal. 
Full support will likely depend on the backing store eventually 
implemented, and will remain optional so that any overhead introduced 
with those guarantees need not be experienced by those not requiring 
them.
