# frozen_string_literal: true

require_relative '../spec_helper'
RSpec.describe ServiceArea do
  subject(:request) { described_class.new(file_path: file_path).service_area_details }

  describe '#service_area_details' do
    context 'when wrong file path passed' do
      let(:file_path) { 'test' }

      it 'returns an error' do
        expect { request }.to raise_error(RuntimeError, 'No such file path like test.yaml.')
      end
    end
  end
end
