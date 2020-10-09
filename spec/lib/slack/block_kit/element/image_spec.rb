# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::Image do
  let(:instance) { described_class.new(**params) }
  let(:url) { 'http://placekitten.com/800/400' }
  let(:alternate_text) { 'alt text' }
  let(:title) { 'title for image' }

  context('without title') do
    let(:params) do
      {
        image_url: url,
        alt_text: alternate_text
      }
    end

    describe '#as_json' do
      subject(:as_json) { instance.as_json }

      let(:expected_json) do
        {
          type: 'image',
          image_url: url,
          alt_text: alternate_text
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end
  end

  context 'with title' do
    let(:params) do
      {
        image_url: url,
        alt_text: alternate_text,
        title: title
      }
    end

    describe '#as_json' do
      subject(:as_json) { instance.as_json }

      let(:expected_json) do
        {
          type: 'image',
          title: {
            type: 'plain_text',
            text: title
          },
          image_url: url,
          alt_text: alternate_text
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end
  end
end
