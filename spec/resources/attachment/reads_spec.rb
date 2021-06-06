require 'rails_helper'
require 'shared_context/attached_content'

RSpec.describe AttachmentResource, type: :resource do
  describe 'serialization' do
    include_context 'attached content'

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(content.images[0].id)
      expect(data.jsonapi_type).to eq('attachments')

      expect(data.attributes['record_type']).to eq('Content')
      expect(data.attributes['filename']).to eq('test1.png')
      expect(data.attributes['content_type']).to eq('image/png')
    end
  end
end