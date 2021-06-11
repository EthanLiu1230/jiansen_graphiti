require 'rails_helper'

RSpec.describe ContentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'contents',
          attributes: attributes_for(:content)
        }
      }
    end

    let(:instance) do
      ContentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Content.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:content) { create(:content) }

    let(:payload) do
      {
        data: {
          id: content.id.to_s,
          type: 'contents',
          attributes: { body: 'new body' }
        }
      }
    end

    let(:instance) do
      ContentResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { content.reload.updated_at }.and change { content.body }.to('new body')
    end
  end

  describe 'destroying' do
    let!(:content) { create(:content) }

    let(:instance) do
      ContentResource.find(id: content.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Content.count }.by(-1)
    end
  end
end
