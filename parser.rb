# frozen_string_literal: true

# handling the parsing process, It co-ordinates accepting the inputs and
# notifying all the objects required to build the output.
class Parser
  def initialize(filename)
    raise ArgumentError, 'a log file must be provided' if filename.nil?

    self.filename = filename
  end

  def run
    return empty_message if no_results?
  end

  private

  attr_accessor :filename

  def empty_message
    'No results found!'
  end

  def entries
    File.read(File.expand_path("../#{filename}", __FILE__))
  end

  def no_results?
    entries.size.zero?
  end
end

terminal_output = $PROGRAM_NAME == __FILE__
puts Parser.new(ARGV[0]).run if terminal_output
