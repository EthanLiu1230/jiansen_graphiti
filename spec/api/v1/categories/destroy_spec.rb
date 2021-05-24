require 'rails_helper'
require 'shared/context/with_admin_token'

RSpec.describe "categories#destroy", type: :request do
  include_context 'with_admin_token'
  subject(:make_request) do
    jsonapi_delete "/api/v1/categories/#{category.id}", headers: with_admin_token
  end

  describe 'basic destroy' do
    let!(:category) { create(:category) }

    it 'updates the resource' do
      expect(CategoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Category.count }.by(-1)
      expect { category.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
