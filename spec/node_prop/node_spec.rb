require 'spec_helper'

describe NodeProp::Node do
  
  before do
    @klass = NodeProp::Node
  end
  
  it 'exists' do
    @klass.should_not be_nil
  end
  
  it 'is a module' do
    @klass.should be_a_kind_of(Module)
  end
  
  it 'includes the activesupport concern behavior' do
    @klass.included_modules.should include(ActiveSupport::Concern)
  end
  
  it 'defines a ClassMethods module for use by activesupport concern behavior' do
    NodeProp::Node::ClassMethods.should_not be_nil
  end
  
  it 'defines an InstanceMethods module for use by activesupport concern behavior' do
    NodeProp::Node::InstanceMethods.should_not be_nil
  end
  
  describe 'class methods' do
    
    before do
      @including_klass = dynamic_subclass(Object, :includes => [NodeProp::Node], :class_suffix => 'Node')
    end
    
  end
  
  describe 'instance methods' do
    
    before do
      @including_klass = dynamic_subclass(Object, :includes => [NodeProp::Node], :class_suffix => 'Node')
      @including_klass_instance = @including_klass.new
    end
    
  end
  
end
