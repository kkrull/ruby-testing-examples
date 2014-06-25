require 'includes_external_help'
require 'support/locally_included_module'

RSpec.configure { |config| config.include(LocallyIncludedModule) }

describe IncludesExternalHelp do
  describe 'helper methods in spec modules' do
    context 'when including the module with RSpec::configure' do
      it 'specs can access instance methods from the module' do
        expect(help_from_module_instance_method).to be(:available)
      end
    end
  end
end