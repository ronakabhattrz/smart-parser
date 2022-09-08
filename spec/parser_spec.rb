# frozen_string_literal: true

require 'spec_helper'
require_relative '../parser'

RSpec.describe Parser do
  describe '.new' do
    describe 'without a file argument' do
      it 'raises an error' do
        expect { described_class.new }
          .to raise_error(ArgumentError)
      end
    end

    describe 'when the provided file is nil or does not exist' do
      it 'raises an error' do
        expect { described_class.new(nil) }
          .to raise_error(ArgumentError, 'a log file must be provided')
        expect { described_class.new('no.log') }
          .to raise_error(ArgumentError, 'file does not exist')
      end
    end
  end

  describe '#run' do
    subject { described_class.new(filename).run }

    describe 'with an empty log' do
      let(:filename) { 'spec/fixtures/empty.log' }

      it { is_expected.to eq 'No results found!' }
    end

    describe 'with multiple valid log entries' do
      let(:filename) { 'spec/fixtures/count.log' }

      it { is_expected.to eq "unique\n/about 1 unique view\n/home 1 unique view" }
    end
  end
end
