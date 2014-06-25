require 'bare'

describe Bare do
  subject { Bare.new }
  describe 'modules included in spec_helper' do
    it 'specs can access instance methods from the module' do
      expect(help_from_globally_included_instance_method).to be(:available)
    end
    it 'production code can not reach their methods' do
      expect { subject.try_globally_included_instance_method }.to raise_error(NameError,
          start_with("undefined local variable or method `help_from_globally_included_instance_method'"))
    end
  end

  describe 'modules included in other spec files' do
    it 'specs can not reach their methods' do
      expect { help_from_module_instance_method }.to raise_error(NameError,
          start_with("undefined local variable or method `help_from_module_instance_method'"))
    end
  end
end