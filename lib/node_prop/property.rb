module NodeProp
  
  # Essentially a key-value pair with metadata. It is named, and
  # is also namespaced.
  class Property
    
    # The default option set for a property
    DEFAULT_OPTIONS = {
      :default_value => nil
    }
    
    # The name of the property
    attr_reader :name
    
    # Initializes a property object
    # @param [ Symbol ] property_name The name of the property
    # @param [ Hash ] default_option_overrides A hash of options, overriding the default options, set in the DEFAULT_OPTIONS constant
    def initialize property_name, default_option_overrides = {}
      @options = DEFAULT_OPTIONS.merge default_option_overrides
      @name = property_name
    end
    
    # The default value of this property. If this default value is not overriden, then any
    # query for this attribute will return a value equal to the value returned by this accessor
    # @return The default value for this property
    def default_value
      @options[:default_value]
    end
    
    # Set the default value for this property
    # @param new_default_value The new default value for this property
    def default_value= new_default_value
      @options[:default_value] = new_default_value
    end
    
  end
  
end
