# frozen_string_literal: true

require 'spec_helper'
require_relative '../formatter'

RSpec.describe Formatter do
  describe '.new' do
    describe 'when no argument is given' do
      it 'raises an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end

    describe 'when page_count is nil' do
      it 'raises an error' do
        expect { described_class.new(nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#to_string' do
    let(:page_count) { { total: [['/about', 1], ['/home', 2]] } }
    subject { described_class.new(page_count).to_string }

    it 'returns the sorted counts as a string' do
      is_expected.to eq "total\n/home 2 unique views\n/about 1 unique view"
    end

    describe 'when the page count is empty' do
      let(:page_count) { { total: [], unique: [] } }

      it 'returns No Results' do
        is_expected.to eq('No results found!')
      end
    end
  end
end
