# frozen_string_literal: true

require_relative './formatter'
require_relative './page_count'
class Parser
  def initialize(filename)
    raise ArgumentError, 'a log file must be provided' if filename.nil?

    self.filename = filename
  end

  def run
    return empty_message if no_results?

    results
  end

  private

  attr_accessor :filename

  def empty_message
    'No results found!'
  end

  def no_results?
    entries.size.zero?
  end

  def entries
    File.readlines(File.expand_path("../#{filename}", __FILE__))
  end

  def results
    Formatter.new(counts).to_string
  end

  def counts
    @counts = PageCount.new(entries).all
  end
end

terminal_output = $PROGRAM_NAME == __FILE__
puts Parser.new(ARGV[0]).run if terminal_output
