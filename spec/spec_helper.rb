require 'cover_me'

CoverMe.config do |c|
  # where is your project's root:
  c.project.root = File.absolute_path(File.join(File.dirname(__FILE__),'..'))

  c.formatter = CoverMe::HtmlFormatter

  c.html_formatter.output_path = File.join(CoverMe.config.project.root, 'coverage')
  
  # what files are you interested in coverage for:
  c.file_pattern = /#{CoverMe.config.project.root}\/lib\/.+\.rb/ix  

  c.at_exit = Proc.new{}
end

require 'rspec'
require 'rspec/autorun'
require 'node_prop'

# Creates a subclass of the given class with no name, i.e.
# not assigned to a constant
def dynamic_anonymous_subclass class_to_subclass
  Class.new(class_to_subclass)
end

# Creates a class, which is a subclass of the given class
def dynamic_subclass class_to_subclass = Object, opts = {}
  opts = { 
    :class_location => self.class,
    :class_prefix => "",
    :class_suffix => "",
    :class_identifier => "DynamicClass",
    :class_unique_id => self.object_id,
    :includes => []
    }.merge(opts)
  class_name = opts[:class_name] ? opts[:class_name] : "#{opts[:class_prefix]}#{opts[:class_identifier]}#{opts[:class_unique_id]}#{opts[:class_suffix]}"
  class_constant = opts[:class_location].const_set(class_name, dynamic_anonymous_subclass(class_to_subclass))
  class_constant.class_eval do
    opts[:includes].each do |module_to_include|
      include module_to_include
    end
  end
  class_constant
end
