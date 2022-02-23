require 'spec_helper'

require 'lib/parser'

RSpec.describe Parser do
  it 'raises exception when no path provided' do
    expect { Parser.new(nil).call } .to raise_exception(RuntimeError)
  end

  it 'raises exception when path does not exist' do
    expect { Parser.new('wrong').call } .to raise_exception(RuntimeError)
  end
end
