require 'spec_helper'

describe Cattify do
  subject { Cattify.new }

  describe '#process' do
    let(:input) { 'My person gave me yarn for Christmas.' }
    let(:output) { subject.process(input) }

    it 'converts to lowercase' do
      expect(output.downcase).to eq output
    end

    it 'combines nouns with cat adjectives' do
      expect(output).to match /purry person./i
      expect(output).to match /mewly yarn./i
      expect(output).to match /meowwwer christmas./i
    end

    it 'always appends "meow."' do
      expect(output).to end_with 'meow.'
    end
  end
end
