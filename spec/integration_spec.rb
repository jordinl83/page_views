# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable RSpec/DescribeClass
RSpec.describe 'Integration tests' do
  it 'executes command line script' do
    expect(`./bin/analyze fixtures/example.log`)
      .to include(['/page1 1.1.1.1',
                   '/page2 2.2.2.2'].join("\n"))
  end

  it 'prints error message and exits if there is an error', focus: true do
    expect(`./bin/analyze wrong`).to include('could not be found')
    expect($?.exitstatus).to eq(1)
  end
end
# rubocop:enable RSpec/DescribeClass
