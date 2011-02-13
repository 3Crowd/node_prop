require 'spec_helper'

describe NodeProp::Error do
  
  before do
    @klass = NodeProp::Error
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
    
    it 'is a kind of StandardError' do
      @klass_instance.should be_a_kind_of(StandardError)
    end
    
  end
  
end
