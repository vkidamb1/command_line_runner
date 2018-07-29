require_relative 'lib/constants/application_constants'
require_relative 'lib/exceptions/input_not_valid_exception_error'
require_relative 'lib/user_selection'
#This is the main calls that is supposed to be called to get the application started.
#This class would display the initial prompt options to the users and navigate over to
#User Selection class if the input entered by the user on console are valid
class CommandLineRunner
  def run
    puts ApplicationConstants::WELCOME_MESSAGE
    puts ApplicationConstants::DISPLAY_OPTIONS_MESSAGE
    option = gets.strip
    if option.to_i == 1
      UserSelection.new.search_values
    elsif option.to_i == 2
      UserSelection.new.list_of_searchable_fields
    elsif option == ApplicationConstants::QUIT_MESSAGE
      exit
    else
      raise InputNotValidExceptionError.new(ApplicationConstants::ERROR_MESSAGE_VALIDATION, :run)
    end
  rescue StandardError => error
    puts error.message
  end
  CommandLineRunner.new.run
end
