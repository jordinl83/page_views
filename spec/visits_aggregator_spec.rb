# frozen_string_literal: true

require 'spec_helper'

require 'lib/visits_aggregator'
require 'lib/page_visit'

RSpec.describe VisitsAggregator do
  let(:result) { described_class.new(visits).call }

  context 'when two ips visit the same page' do
    let(:visits) do
      [
        PageVisit.new('/page1', '1.1.1.1'),
        PageVisit.new('/page1', '2.2.2.2')
      ]
    end

    it 'returns one page stats' do
      expect(result.length).to eq(1)
    end

    it 'returns two unique page views for page1' do
      expect(result[0].uniques).to eq(2)
    end

    it 'returns two visits for page1' do
      expect(result[0].visits).to eq(2)
    end
  end

  context 'when one ip visits the same page' do
    let(:visits) do
      [
        PageVisit.new('/page1', '1.1.1.1'),
        PageVisit.new('/page1', '1.1.1.1')
      ]
    end

    it 'returns one page stats' do
      expect(result.length).to eq(1)
    end

    it 'returns one unique page views for page1' do
      expect(result[0].uniques).to eq(1)
    end

    it 'returns two visits for page1' do
      expect(result[0].visits).to eq(2)
    end
  end

  context 'when two ips visit two different pages' do
    let(:visits) do
      [
        PageVisit.new('/page1', '1.1.1.1'),
        PageVisit.new('/page2', '2.2.2.2')
      ]
    end

    let(:page1_stats) { result.detect { |stats| stats.page == '/page1' } }
    let(:page2_stats) { result.detect { |stats| stats.page == '/page2' } }

    it 'returns two page stats' do
      expect(result.length).to eq(2)
    end

    it 'returns one unique page views for page1' do
      expect(page1_stats.uniques).to eq(1)
    end

    it 'returns one visit for page1' do
      expect(page1_stats.visits).to eq(1)
    end

    it 'returns one unique page views for page2' do
      expect(page2_stats.uniques).to eq(1)
    end

    it 'returns one visit for page2' do
      expect(page2_stats.visits).to eq(1)
    end
  end
end
