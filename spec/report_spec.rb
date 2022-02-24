# frozen_string_literal: true

require 'spec_helper'
require 'lib/report'

RSpec.describe Report do
  let(:aggregates) do
    [
      instance_double(PageStats, page: '/page1', visits: 1, uniques: 2),
      instance_double(PageStats, page: '/page2', visits: 3, uniques: 3),
      instance_double(PageStats, page: '/page3', visits: 2, uniques: 1)
    ]
  end

  let(:report) { described_class.new(aggregates).call }

  describe 'visits report' do
    let(:visits_report) { report[0].filter { |line| line.to_s.include?('visits') } }

    it 'returns array of array with visits first' do
      expect(visits_report.length).to eq(3)
    end

    it 'sorts visits in descending order' do
      pages = visits_report.map { |line| line.to_s.scan(/page\d*/) }.flatten
      expect(pages).to eq(%w[page2 page3 page1])
    end
  end

  describe 'views report' do
    let(:views_report) { report[1].filter { |line| line.to_s.include?('views') } }

    it 'returns array of array with views last' do
      expect(views_report.length).to eq(3)
    end

    it 'sorts unique views in descending order' do
      pages = views_report.map { |line| line.to_s.scan(/page\d*/) }.flatten
      expect(pages).to eq(%w[page2 page1 page3])
    end
  end
end
