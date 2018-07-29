require_relative '../../lib/models/utility'
require_relative '../../lib/models/user'
require_relative '../../lib/decorators/output_decorator'
require_relative '../../lib/validators/application_validator'
require_relative '../../lib/constants/application_constants'
RSpec.describe User do
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
      it { expect { subject.search('_id', '100') }.to raise_error('No results found') }
      it { expect { subject.search('tags', '1') }.to raise_error('No results found') }
      it { expect { subject.search('locale', '1') }.to raise_error('No results found') }
      it { expect { subject.search('timezone', '1') }.to raise_error('No results found') }
      it { expect { subject.search('email', '1') }.to raise_error('No results found') }
    end
    context 'when the search value and search term are available ' do
      it { expect(subject.search('_id', '10')).not_to be_empty }
      it { expect(subject.search('tags', 'Sutton')).not_to be_empty }
      it { expect(subject.search('locale', 'en-AU')).not_to be_empty }
      it { expect(subject.search('created_at', '2016-06-23T10:31:39 -10:00')).not_to be_empty }
      it { expect(subject.search('external_id', '74341f74-9c79-49d5-9611-87ef9b6eb75f')).not_to be_empty }
    end
  end
end
