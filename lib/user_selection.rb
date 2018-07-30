require_relative 'constants/application_constants'
require_relative 'models/utility'
require_relative 'models/ticket'
require_relative 'models/organization'
require_relative 'models/user'
# This class prompts the user to enter the search criteria and
# calls the respective classes depending the options selected
# by the user
class UserSelection
  def search_values
    puts ApplicationConstants::DISPLAY_SEARCH_OPTIONS_MESSAGE
    option = gets.strip
    if option.to_i == 1
      prompt_values = prompt_search_criteria
      User.new.search(prompt_values.first, prompt_values.last)
    elsif option.to_i == 2
      prompt_values = prompt_search_criteria
      Ticket.new.search(prompt_values.first, prompt_values.last)
    elsif option.to_i == 3
      prompt_values = prompt_search_criteria
      Organization.new.search(prompt_values.first, prompt_values.last)
    elsif option == ApplicationConstants::QUIT_MESSAGE
      exit
    else
      raise InputNotValidExceptionError.new(ApplicationConstants::ERROR_MESSAGE_VALIDATION, :search_value)
    end
  end

  def prompt_search_criteria
    puts ApplicationConstants::SEARCH_TERM_MESSAGE
    term = gets.strip
    puts ApplicationConstants::SEARCH_VALUE_MESSAGE
    value = gets.strip
    [term, value]
  end

  def list_of_searchable_fields
    User.new.searchable_fields
    Ticket.new.searchable_fields
    Organization.new.searchable_fields
    exit
  end
end
