require_relative '../lib/user_selection'
RSpec.describe UserSelection do
  describe '#search_values' do
    context 'while user selects quit' do
      let(:quit_as_input) { allow_any_instance_of(UserSelection).to receive(:gets).and_return('quit') }

      before(:each) do
        quit_as_input
      end
      it { expect { subject.search_values }.to raise_error(SystemExit) }
    end

    context 'while user selects invalid input' do
      let(:invalid_input) { allow_any_instance_of(UserSelection).to receive(:gets).and_return('7') }

      before(:each) do
        invalid_input
      end
      it { expect { subject.search_values }.to raise_error { 'Please Enter Valid Input' } }
    end
  end
end
