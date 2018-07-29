require_relative '../../lib/constants/application_constants'
RSpec.describe ApplicationConstants do
  describe 'Constants values validation' do
    it 'WELCOME MESSAGE' do
      expect(ApplicationConstants::WELCOME_MESSAGE).to eq("Welcome to ZenDesk Search\n" \
    		"Type 'quit' to exit the application any time," \
    		"Press 'Enter' to continue\n")
    end

    it 'ERROR MESSAGE' do
      expect(ApplicationConstants::ERROR_MESSAGE_FOR_SELECTION).to eq('Please enter valid selection')
    end

    it 'DISPLAY OPTIONS MESSAGE' do
      expect(ApplicationConstants::DISPLAY_OPTIONS_MESSAGE).to eq("\t Select search options:\n \t" \
    		"* Press 1 to search Zendesk\n\t" \
    		"* Press 2 to view a list of searchable fields\n\t" \
    		"* Type 'quit' to exit")
    end

    it 'SEARCH OPTIONS MESSAGE' do
      expect(ApplicationConstants::DISPLAY_SEARCH_OPTIONS_MESSAGE).to eq('Select 1)Users or 2)Tickets or 3)Organizations')
    end

    it 'SEARCH TERM MESSAGE' do
      expect(ApplicationConstants::SEARCH_TERM_MESSAGE).to eq('Enter search term')
    end

    it 'SEARCH VALUE MESSAGE' do
      expect(ApplicationConstants::SEARCH_VALUE_MESSAGE).to eq('Enter search value')
    end

    it 'QUIT MESSAGE' do
      expect(ApplicationConstants::QUIT_MESSAGE).to eq('quit')
    end

    it 'ERROR MESSAGE VALIDATION' do
      expect(ApplicationConstants::ERROR_MESSAGE_VALIDATION).to eq('Please Enter Valid Input')
    end

    it 'ERROR MESSAGE SEARCH TERM' do
      expect(ApplicationConstants::ERROR_MESSAGE_SEARCH_TERM).to eq('Please enter Valid Search Term')
    end

    it 'NO RESULTS MESSAGE' do
      expect(ApplicationConstants::NO_RESULTS_MESSAGE).to eq('No results found')
    end
  end
end
