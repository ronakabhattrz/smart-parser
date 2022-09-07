# frozen_string_literal: true

class PageCount
  # entries - An array of Strings
  def initialize(entries)
    raise ArgumentError, 'entries are nil' if entries.nil?

    self.entries = entries
  end

  def all
    total_counts.to_a
  end

  private

  attr_accessor :entries

  def total_counts
    @total_counts ||= entries.each_with_object({}, &method(:calculate))
  end

  def calculate(entry, hash)
    path, _ip = entry.split
    hash[path] ||= 0
    hash[path] += 1
  end
end
