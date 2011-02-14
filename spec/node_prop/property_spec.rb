require 'spec_helper'

describe NodeProp::Property do
  
  before do
    @klass = NodeProp::Property
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
      @property_name = :test_property
      @klass_instance = @klass.new @property_name
    end
    
    describe 'attribute: name' do
      
      describe 'reader' do
        
        it 'exists' do
          @klass_instance.should respond_to(:name)
        end
        
        it 'returns the name of the property' do
          @klass_instance.name.should eql(@property_name)
        end
        
      end
      
    end
    
    describe 'attribute: default_value' do
      
      describe 'reader' do
        
        before do
          @default_property_value = :default_value_for_property
          @klass_instance.default_value = @default_property_value
        end
        
        it 'exists' do
          @klass_instance.should respond_to(:default_value)
        end
        
        it 'returns the default value of the property' do
          @klass_instance.default_value.should eql(@default_property_value)
        end
        
      end
      
      describe 'writer' do
        
        it 'exists' do
          @klass_instance.should respond_to(:default_value=)
        end
        
        it 'sets the default value of the property' do
          new_default_value = :new_default_value
          @klass_instance.default_value = new_default_value
          @klass_instance.default_value.should eql(new_default_value)
        end
        
      end
      
    end
    
    describe 'method: initialize' do
      
      context 'with one argument, the property tag' do
        
        it 'set the name of the property' do
          @klass_instance.name.should eql(@property_name)
        end
        
        it 'set the default value of the property to nil' do
          @klass_instance.default_value.should be_nil
        end
        
      end
      
      context 'with two arguments, the first is the property tag, and the second a set of options' do
        
        context 'when the options have a :default_value key' do
          
          before do
            @default_value = :test_default_value
            @klass_instance = @klass.new @property_name, :default_value => @default_value
          end
          
          it 'should have the default value set by the option set' do
            @klass_instance.default_value.should eql(@default_value)
          end
          
        end
        
      end
      
    end
    
  end
  
end
