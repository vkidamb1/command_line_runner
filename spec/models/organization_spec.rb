require_relative '../../lib/models/utility'
require_relative '../../lib/models/organization'
require_relative '../../lib/decorators/output_decorator'
require_relative '../../lib/validators/application_validator'
require_relative '../../lib/constants/application_constants'
RSpec.describe Organization do
  before (:each) do
    @user_headers = JSON.parse(File.read(File.absolute_path('data') + "/#{subject.class.name.downcase}s.json")).first.keys
  end

  describe '#searchable_fields' do
    it 'The list of searchable fields that are retrieved from the user should be equal to keys of first data object' do
      expect(subject.searchable_fields.count).to eq(@user_headers.count)
    end
  end

  describe '#search' do
    context 'when the search term is not available in the list' do
      it { expect { subject.search('id', '1') }.to raise_error('Please enter Valid Search Term') }
      it { expect { subject.search('tag', '1') }.to raise_error('Please enter Valid Search Term') }
      it { expect { subject.search('desc', '1') }.to raise_error('Please enter Valid Search Term') }
      it { expect { subject.search('', '1') }.to raise_error('Please enter Valid Search Term') }
      it { expect { subject.search('3433.123', '1') }.to raise_error('Please enter Valid Search Term') }
    end
    context 'when the search value is not available in the list' do
      it { expect { subject.search('_id', '1001') }.to raise_error('No results found') }
      it { expect { subject.search('name', 'avg') }.to raise_error('No results found') }
      it { expect { subject.search('shared_tickets', '1') }.to raise_error('No results found') }
    end
    context 'when the search value and search term are available ' do
      it { expect(subject.search('_id', '101')).not_to be_empty }
      it { expect(subject.search('name', 'Enthaze')).not_to be_empty }
      it { expect(subject.search('shared_tickets', 'false')).not_to be_empty }
    end
  end
end
