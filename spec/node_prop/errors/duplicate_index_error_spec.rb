require 'spec_helper'

describe NodeProp::Errors::DuplicateIndexError do
  
  before do
    @klass = NodeProp::Errors::DuplicateIndexError
  end
  
  it 'exists' do
    @klass.should_not be_nil
  end
  
  it 'is a class' do
    @klass.should be_a_kind_of(Class)
  end
  
  context 'instance' do
    
    before do
      @klass_instance = @klass.new
    end
    
    it 'is a kind of NodeProp::Error' do
      @klass_instance.should be_a_kind_of(NodeProp::Error)
    end
    
  end
  
end
