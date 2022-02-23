# frozen_string_literal: true

require 'spec_helper'

require 'lib/parser'

RSpec.describe Parser do
  it 'raises exception when no path provided' do
    expect { described_class.new(nil).call }.to raise_exception(RuntimeError)
  end

  it 'raises exception when path does not exist' do
    expect { described_class.new('wrong').call }.to raise_exception(RuntimeError)
  end
end
