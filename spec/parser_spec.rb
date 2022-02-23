# frozen_string_literal: true

require 'spec_helper'

require 'lib/parser'
require 'lib/page_visit'

RSpec.describe Parser do
  it 'raises exception when no path provided' do
    expect { described_class.new(nil).call }.to raise_exception(RuntimeError)
  end

  it 'raises exception when path does not exist' do
    expect { described_class.new('wrong').call }.to raise_exception(RuntimeError)
  end

  it 'parses page views from log file' do
    allow(File).to receive(:foreach).and_yield('/page1 1.1.1.1').and_yield('/page2 2.2.2.2')
    page_views = described_class.new('webserver.log').call
    expect(page_views).to eq([PageVisit.new('/page1', '1.1.1.1'), PageVisit.new('/page2', '2.2.2.2')])
  end
end
