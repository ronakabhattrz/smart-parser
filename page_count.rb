# frozen_string_literal: true

class PageCount
  # entries - An array of Strings
  def initialize(entries)
    raise ArgumentError, 'entries are nil' if entries.nil?

    self.entries = entries
  end

  def all
    {
      total: total_counts.to_a,
      unique: unique_counts.map { |path, counts| [path, counts.keys.size] }
    }
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

  def unique_counts
    @unique_counts ||= entries.each_with_object({}) do |entry, hash|
      path, ip = entry.split
      hash[path] ||= {}
      hash[path][ip] ||= 0
      hash[path][ip] += 1
      hash
    end
  end
end
