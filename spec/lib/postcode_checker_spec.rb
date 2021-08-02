# frozen_string_literal: true

require_relative '../spec_helper'
RSpec.describe PostcodeChecker, :vcr do
  describe '#valid?' do
    subject(:request) { described_class.new(postcode).valid? }

    context 'when requested postcode is blank?' do
      let(:postcode) { '' }

      it 'returns message' do
        expect(request).to eq('Please enter a postcode.')
      end
    end

    context 'when requested postcode lsoa is out of service area' do
      let(:postcode) { 'BR1 3UH' }

      it 'returns error message' do
        expect(request).to eq('Entered postcode is not in our service area.')
      end
    end

    context 'when requested postcode lsoa is in service areas' do
      let(:postcode) { 'SE1 7QD' }

      it 'returns message' do
        expect(request).to eq('Entered postcode is in our service area.')
      end
    end

    context 'when outcode of postcode passed' do
      let(:postcode) { 'SH241AB' }

      it 'returns message' do
        expect(request).to eq('Entered postcode is in our service area.')
      end
    end

    context 'when invalid post code is passed ' do
      let(:postcode) { 'SH24B' }

      it 'returns error message' do
        expect(request).to eq('Entered postcode is not in our service area.')
      end
    end
  end
end
