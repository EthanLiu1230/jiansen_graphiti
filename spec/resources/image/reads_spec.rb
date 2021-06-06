require 'rails_helper'
require 'shared_context/attached_content'

RSpec.describe ImageResource, type: :resource do
  describe 'serialization' do
    include_context 'attached content'
    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.jsonapi_type).to eq('attachments')
      expect(data.attributes['url']).to eq(Rails.application.routes.url_helpers.url_for(content.images[0]))
    end
  end
end