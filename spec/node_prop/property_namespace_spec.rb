require 'spec_helper'

describe NodeProp::PropertyNamespace do
  
  before do
    @klass = NodeProp::PropertyNamespace
  end
  
  it 'exists' do
    @klass.should_not be_nil
  end
  
  it 'is a class' do
    @klass.should be_a_kind_of(Class)
  end
  
  describe 'class methods' do
  end
  
  describe 'instance methods' do
    
    before do
      @klass_instance = @klass.new
    end
    
  end
  
end
