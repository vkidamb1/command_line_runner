require 'json'
require_relative '../decorators/output_decorator'
require_relative '../validators/application_validator'
#This class acts as Parent Class for User, Ticket and Organization classes.
#As all the three child classes functionality are same as of now 
#we have created generic methods in this classthat are applicable
#to instances of individual class
class Utility
  def searchable_fields
    puts "-----------------------\nSearch #{self.class.name} with"
    read.first.keys.each { |ele| puts "#{ele}\n" }
  end

  def search(search_term, search_value)
    ApplicationValidator.validate(read.first.keys, search_term)
    puts "Searching #{self.class.name} for #{search_term} with a value of #{search_value}"
    output = resultant_search(search_term, search_value)
    ApplicationValidator.validate_output(output)
    OutputDecorator.print_output(output)
  end

  def read
    @read ||= JSON.parse(File.read(path))
  end

  def resultant_search(search_term, search_value)
    if read.first[search_term].is_a?(Array)
      read.select { |h| h[search_term].include?(search_value) }
    else
      read.select { |h| h[search_term].to_s == search_value }
    end
  end

  private

  def path
    @path ||= File.absolute_path('data') + "/#{self.class.name.downcase}s.json"
  end
end
