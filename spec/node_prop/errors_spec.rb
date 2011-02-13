require 'spec_helper'

describe NodeProp::Errors do
  
  before do
    @klass = NodeProp::Errors
  end
  
  it 'exists' do
    @klass.should_not be_nil
  end
  
  it 'is a module' do
    @klass.should be_a_kind_of(Module)
  end
  
end
