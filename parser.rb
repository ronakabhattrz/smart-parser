# frozen_string_literal: true

require_relative './formatter'
require_relative './page_count'
class Parser
  def initialize(filename)
    raise ArgumentError, 'a log file must be provided' if filename.nil?
    raise ArgumentError, 'file does not exist' unless File.exist?(filename)

    self.filename = File.expand_path("../#{filename}", __FILE__)
  end

  def run
    results
  end

  private

  attr_accessor :filename

  def no_results?
    entries.size.zero?
  end

  def entries
    File.foreach(filename)
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
