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
  
  describe 'class methods' do
  end
  
  describe 'instance' do
    
    before do
      @klass_instance = NodeProp::Graph.new
    end
    
    describe 'nodes attribute' do
      
      describe 'reader' do
        
        it 'exists' do
          @klass_instance.should respond_to(:nodes)
        end
        
        it 'returns an object which is a kind of array' do
          @klass_instance.nodes.should be_a_kind_of(Array)
        end
        
      end
      
    end
    
    describe 'method initialize' do
      
      it 'should initialize the nodes attribute to be empty' do
        @klass_instance.nodes.should be_empty
      end
      
    end
    
  end
  
end
