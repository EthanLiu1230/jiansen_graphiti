require 'rails_helper'
require 'shared_context/attached_content'

RSpec.describe 'images#index', type: :request do
  include_context 'attached content'
  let(:images) { content.images }
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/images", params: params
  end

  describe 'basic fetch' do

    it 'works' do
      expect(ImageResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['attachments'])
      expect(d.map(&:id)).to match_array(images.map(&:id))
    end
  end
end