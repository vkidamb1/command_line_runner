# This class holds the validation specific methods in the application
require_relative '../exceptions/element_is_nil_exception_error'
require_relative '../exceptions/element_is_not_included_exception_error'
class ApplicationValidator
  def self.validate(input, search_term)
    raise ElementIsNilExceptionError.new(ApplicationConstants::INPUT_OBTAINED_IS_EMPTY, :validate) if input.empty? || input.nil?
    raise ElementIsNotIncludedExceptionError.new(ApplicationConstants::ERROR_MESSAGE_SEARCH_TERM, :validate) if input.include?(search_term) == false
  end

  def self.validate_output(output)
    raise ElementIsNilExceptionError.new(ApplicationConstants::NO_RESULTS_MESSAGE, :validate_output) if output.nil? || output.empty?
  end
end
