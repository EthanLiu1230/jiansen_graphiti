require 'rails_helper'

RSpec.describe AttachmentResource, type: :resource do
  describe 'serialization' do
    let!(:content) { create(:content) }
    before(:example) do
      content.images.attach([
        fixture_file_upload('test1.png', 'image/png'),
        fixture_file_upload('test2.png', 'image/png'),
      ])
    end

    it 'works' do
      render
      data = jsonapi_data[0]
      p data.inspect
      expect(data.id).to eq(content.images[0].id)
      expect(data.jsonapi_type).to eq('attachments')
      expect(data.attributes['record_type']).to eq('Content')
      expect(data.attributes['filename']).to eq('test1.png')
      expect(data.attributes['url']).to eq(Rails.application.routes.url_helpers.url_for(content.images[0]))
      expect(data.attributes['content_type']).to eq('image/png')
    end
  end
end