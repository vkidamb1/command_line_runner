# This class is going to have all the methods that require custom decoration
class OutputDecorator
  def self.print_output(output)
    output.each do |ele|
      ele.each { |key, value| printf "%-40s %s\n", key, value }
      puts '---------------------------------------------'
    end
end
end
