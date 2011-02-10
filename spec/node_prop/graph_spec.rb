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
    
    describe 'method: add_node!' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:add_node!)
      end
      
      context 'with one argument, the node to add' do
        
        before do
          @node_to_add = dynamic_subclass(Object, :includes => [NodeProp::Node], :class_suffix => 'Node')
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
        
        it 'returns the graph instance' do
          @klass_instance.remove_node!(@node_to_remove).should eql(@klass_instance)
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
        
        it 'returns the graph instance' do
          @klass_instance.add_index!(@index_to_add).should eql(@klass_instance)
        end
        
      end
      
    end
    
    describe 'method: remove_index' do
      
      it 'is defined' do
        @klass_instance.methods.should include(:remove_index!)
      end
      
      context 'with one argument, the index to remove' do
        
        before do
          @index_to_remove = NodeProp::Index.new
        end
        
        it 'returns the graph instance' do
          @klass_instance.remove_index!(@index_to_remove).should eql(@klass_instance)
        end
        
      end
      
    end
    
  end
  
end
