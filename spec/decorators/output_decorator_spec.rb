require_relative '../../lib/decorators/output_decorator'
RSpec.describe OutputDecorator do
  let(:output_obtained) { { created_at: '2016-04-28T11:19:34 -10:00', type: 'incident', subject: 'A Catastrophe in Korea (North)' } }

  describe '.print_output' do
    it { expect { described_class.print_output(output_obtained) }.to output(/incident/).to_stdout }
    it { expect { described_class.print_output(output_obtained) }.to output(/created_at/).to_stdout }
    it { expect { described_class.print_output(output_obtained) }.to output(/2016-04-28T11:19:34 -10:00/).to_stdout }
    it { expect { described_class.print_output(output_obtained) }.to output(/2016-04/).to_stdout }
    it { expect { described_class.print_output(output_obtained) }.to output(/Catastrophe/).to_stdout }
  end
end
