require_relative '../command_line_runner'
RSpec.describe CommandLineRunner do
  describe '#run' do
    context 'while user selects quit' do
      let(:quit_as_input) { allow_any_instance_of(CommandLineRunner).to receive(:gets).and_return('quit') }

      before(:each) do
        quit_as_input
      end
      it { expect { subject.run }.to raise_error(SystemExit) }
    end

    context 'while user selects invalid input' do
      let(:invalid_input) { allow_any_instance_of(CommandLineRunner).to receive(:gets).and_return('7') }
      before(:each) do
        invalid_input
      end
      it { expect { subject.run }.to output(/Please Enter Valid Input/).to_stdout }
    end
  end
end
