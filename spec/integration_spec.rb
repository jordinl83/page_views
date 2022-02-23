# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable RSpec/DescribeClass
RSpec.describe 'Integration tests' do
  it 'executes command line script' do
    expect(`./bin/analyze hello`).to eq("hello\n")
  end
end
# rubocop:enable RSpec/DescribeClass
