# frozen_string_literal: true

require './lib/train'

RSpec.describe Train do
  let(:orient_express) { Train.new('passenger train', 100, 'Istanbul') }

  it 'should be a thing' do
    expect(orient_express).to be_a Train
  end

  it 'has attributes' do
    expect(orient_express.description).to eq('passenger train')
    expect(orient_express.passengers).to eq([])
    expect(orient_express.location).to eq('Istanbul')
  end

  it '#pull_the_rope' do
    expect(orient_express.pull_the_rope).to eq('Woo woooo!')
  end
end
