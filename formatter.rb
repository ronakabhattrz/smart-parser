# frozen_string_literal: true

class Formatter
  # page_count - like an array of arrays.
  def initialize(page_count)
    raise ArgumentError, 'count must be present' if page_count.nil?

    self.page_count = page_count
  end

  def to_string
    return 'No results found!' if page_count.all? { |_key, count| count.empty? }

    output = []
    page_count.each_pair do |type, counts|
      output << type
      sorted(counts).each { |path, count| output << output_text(path, count) }
    end
    output.join("\n")
  end

  private

  attr_accessor :page_count

  def sorted(counts)
    counts.sort { |a, b| b[1] <=> a[1] }
  end

  def output_text(path, count)
    "#{path} #{count} unique view#{'s' if count.zero? || count > 1}"
  end
end
