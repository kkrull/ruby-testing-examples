require 'has_internal_help'

describe HasInternalHelp do
  describe 'helper methods included in the spec' do
    subject { HassInternalHelp.new }

    before(:each) { expect(help_from_spec_method).to be(:available) }
    after(:each) { expect(help_from_spec_method).to be(:available) }
    it 'specs can access the method' do
      expect(help_from_spec_method).to be(:available)
    end
    it 'production code can not access the method' do
      expect { subject.try_spec_method }.to raise_error(NameError)
    end

    def help_from_spec_method
      :available
    end
  end
end
