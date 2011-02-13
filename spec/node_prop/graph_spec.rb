require 'spec_helper'

describe NodeProp::Graph do
  
  before do
    @klass = NodeProp::Graph
  end
  
  it 'exists' do
    @klass.should_not be_nil
  end
  
  it 'is a class' do
    @klass.should be_a_kind_of(Class)
  end
  
  describe 'instance' do
    
    before do
      @klass_instance = NodeProp::Graph.new
    end
    
    describe 'attributes: nodes' do
      
      describe 'reader' do
        
        it 'exists' do
          @klass_instance.should respond_to(:nodes)
        end
        
        it 'returns an object which is a kind of array' do
          @klass_instance.nodes.should be_a_kind_of(Array)
        end
        
      end
      
    end
    
    describe 'attribute: indexes' do
      
      describe 'reader' do
        
        it 'exists' do
          @klass_instance.should respond_to(:indexes)
        end
        
        it 'returns an object with is a kind of array' do
          @klass_instance.indexes.should be_a_kind_of(Array)
        end
        
      end
      
    end
    
    describe 'method: initialize' do
      
      it 'should initialize the nodes attribute to be empty' do
        @klass_instance.nodes.should be_empty
      end
      
      it 'should initialize the indexes attribute to be empty' do
        @klass_instance.indexes.should be_empty
      end
      
    end
    
    describe 'method: has_node?' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:has_node?)
      end
      
      before do
        @node_to_add = dynamic_subclass(Object, :includes => [NodeProp::Node], :class_suffix => 'Node')
      end
      
      context 'with one argument, the node with which we determine membership' do
        
        it 'returns true when the node exists in the graph' do
          @klass_instance.add_node!(@node_to_add)
          @klass_instance.should have_node(@node_to_add)
        end
        
        it 'returns false when the node does not exist in the graph' do
          @klass_instance.should_not have_node(@node_to_add)
        end
        
      end
      
    end
    
    describe 'method: add_node!' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:add_node!)
      end
      
      context 'with one argument, the node to add' do
        
        before do
          @node_to_add = dynamic_subclass(Object, :includes => [NodeProp::Node], :class_suffix => 'Node')
        end
        
        context 'while the node to add is not a member of the graph' do
          
          before do
            @klass_instance.add_node!(@node_to_add)
          end
          
          it 'adds the node to the graph instance' do
            @klass_instance.should have_node(@node_to_add)
          end
          
        end
        
        context 'while the node to add is a member of the graph' do
          
          before do
            @klass_instance.add_node!(@node_to_add)
          end
          
          it 'raises Errors::DuplicateNodeError' do
            lambda{ @klass_instance.add_node!(@node_to_add) }.should raise_error(NodeProp::Errors::DuplicateNodeError)
          end
          
        end
        
        it 'returns the graph instance' do
          @klass_instance.add_node!(@node_to_add).should eql(@klass_instance)
        end
        
      end
      
    end
    
    describe 'method: remove_node!' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:remove_node!)
      end
      
      context 'with one argument, the node to remove' do
        
        before do
          @node_to_remove = dynamic_subclass(Object, :includes => [NodeProp::Node], :class_suffix => 'Node')
        end
        
        context 'with the node to be removed a member of the graph instance' do
          
          before do
            @klass_instance.add_node!(@node_to_remove)
          end
          
          it 'removes the specified node from the graph instance' do
            @klass_instance.remove_node!(@node_to_remove)
            @klass_instance.should_not have_node(@node_to_remove)
          end
          
          it 'returns the graph instance' do
            @klass_instance.remove_node!(@node_to_remove).should eql(@klass_instance)
          end
          
        end
        
        context 'with the node to be remove not a member of the graph instance' do
          
          it 'raises Errors::InvalidMembershipError' do
            lambda{ @klass_instance.remove_node!(@node_to_remove) }.should raise_error(NodeProp::Errors::InvalidNodeMembershipError)
          end
          
        end
        
      end
      
    end
    
    describe 'method: has_index?' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:has_index?)
      end
      
      context 'with one argument, the index for which to query' do
        
        before do
          @index = NodeProp::Index.new
        end
        
        it 'returns true when the index for which to query exists on the graph' do
          @klass_instance.add_index!(@index)
          @klass_instance.should have_index(@index)
        end
        
        it 'returns false when the index for which to query does not exist on the graph' do
          @klass_instance.should_not have_index(@index)
        end
        
      end
      
    end
    
    describe 'method: add_index!' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:add_index!)
      end
      
      context 'with one argument, the index to add' do
        
        before do
          @index_to_add = NodeProp::Index.new
        end
        
        context 'when the index to add does not currently exist on the graph instance' do
          
          it 'attaches the index to the graph instance' do
            @klass_instance.add_index!(@index_to_add)
            @klass_instance.should have_index(@index_to_add)
          end
          
          it 'returns the graph instance' do
            @klass_instance.add_index!(@index_to_add).should eql(@klass_instance)
          end
          
        end
        
        context 'when the index to add exists on the graph instance' do
          
          before do
            @klass_instance.add_index!(@index_to_add)
          end
          
          it 'raises Errors::DuplicateIndexError' do
            lambda{ @klass_instance.add_index!(@index_to_add) }.should raise_error(NodeProp::Errors::DuplicateIndexError)
          end
          
        end
        
      end
      
    end
    
    describe 'method: remove_index!' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:remove_index!)
      end
      
      context 'with one argument, the index to remove' do
        
        before do
          @index_to_remove = NodeProp::Index.new
        end
        
        context 'when the index to remove is currently attached to the graph instance' do
          
          before do
            @klass_instance.add_index!(@index_to_remove)
          end
          
          it 'removes the index from the graph instance' do
            @klass_instance.remove_index!(@index_to_remove)
            @klass_instance.should_not have_index(@index_to_remove)
          end
          
          it 'returns the graph instance' do
            @klass_instance.remove_index!(@index_to_remove).should eql(@klass_instance)
          end
          
        end
        
        context 'when the index to remove is not currently attached to the graph instance' do
          
          it 'raises Errors::InvalidIndexMembershipErrors' do
            lambda{ @klass_instance.remove_index!(@index_to_remove) }.should raise_error(NodeProp::Errors::InvalidIndexMembershipError)
          end
          
        end
        
      end
      
    end
    
  end
  
end
