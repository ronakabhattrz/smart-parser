# frozen_string_literal: true

class Formatter
  # page_count - like an array of arrays.
  def initialize(page_count)
    raise ArgumentError, 'count must be present' if page_count.nil?

    self.page_count = page_count
  end

  def to_string
    sorted_total_counts.map { |path, count| path_with_count(count, path) }.join("\n")
  end

  private

  def path_with_count(count, path)
    "#{path} #{count} visit#{'s' if count.zero? || count > 1}"
  end

  attr_accessor :page_count

  def sorted_total_counts
    page_count.sort { |a, b| b[1] <=> a[1] }
  end
end
