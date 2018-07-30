require_relative '../../lib/validators/application_validator'
require_relative '../../lib/exceptions/element_is_nil_exception_error'
require_relative '../../lib/exceptions/element_is_not_included_exception_error'
require_relative '../../lib/constants/application_constants'

RSpec.describe ApplicationValidator do
  describe '.validate' do
    context 'with negative scenarios' do
      it { expect { described_class.validate('[5,6,7]', '1') }.to raise_error(ApplicationConstants::ERROR_MESSAGE_SEARCH_TERM) }
      it { expect { described_class.validate('["_id","submitter_id]', ' ') }.to raise_error(ApplicationConstants::ERROR_MESSAGE_SEARCH_TERM) }
      it { expect { described_class.validate('', '1') }.to raise_error(ApplicationConstants::INPUT_OBTAINED_IS_EMPTY) }
      it { expect { described_class.validate('["type","tags"]', 'yyy') }.to raise_error(ApplicationConstants::ERROR_MESSAGE_SEARCH_TERM) }
    end

    context 'with positive scenarios' do
      it { expect(described_class.validate('[1,2,3]', '1')).to eq(nil) }
      it { expect(described_class.validate('["_id","submitter_id]', '_id')).to eq(nil) }
      it { expect(described_class.validate('text', 'text')).to eq(nil) }
    end
  end

  describe '.validate_output' do
    context 'with negative scenarios' do
      it { expect { described_class.validate_output(nil) }.to raise_error(ApplicationConstants::NO_RESULTS_MESSAGE) }
      it { expect { described_class.validate_output('') }.to raise_error(ApplicationConstants::NO_RESULTS_MESSAGE) }
    end

    context 'with positive scenarios' do
      it { expect(described_class.validate_output("text: 'heyy'")).to eq(nil) }
      it { expect(described_class.validate_output('232')).to eq(nil) }
      it { expect(described_class.validate_output(' ')).to eq(nil) }
    end
  end
end
