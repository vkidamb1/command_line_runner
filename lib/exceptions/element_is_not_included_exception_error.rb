#This Cutom Exception class has been created to hold the custom errors/exceptions
#that occur explicitly as part of this application
class ElementIsNotIncludedExceptionError < StandardError
  attr_reader :action

  def initialize(message, action)
    super(message)
    @action = action
  end
end
