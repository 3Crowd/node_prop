describe NodeProp::Version do

  it 'exists' do
    NodeProp::Version.should_not be_nil
  end

  it 'is a module' do
    NodeProp::Version.should be_a_kind_of(Module)
  end

  it 'returns the standard format for the version information it contains when to_standard_format is called' do
    NodeProp::Version.to_standard_format.should == [NodeProp::Version::MAJOR, NodeProp::Version::MINOR, NodeProp::Version::PATCH].join('.')
  end

end
