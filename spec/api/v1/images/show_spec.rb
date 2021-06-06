require 'rails_helper'
require 'shared_context/attached_content'

RSpec.describe "images#show", type: :request do
  include_context 'attached content'
  let(:params) { {} }
  let(:image) { content.images[0] }
  subject(:make_request) do
    jsonapi_get "/api/v1/images/#{image.id}", params: params
  end

  describe 'basic fetch' do

    it 'works' do
      expect(ImageResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('attachments')
      expect(d.id).to eq(image.id)
    end
  end
end
