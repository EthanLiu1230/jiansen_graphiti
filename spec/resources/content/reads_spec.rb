require 'rails_helper'

RSpec.describe ContentResource, type: :resource do
  describe 'serialization' do
    let!(:content) { create(:content) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(content.id)
      expect(data.jsonapi_type).to eq('contents')
    end
  end

  describe 'filtering' do
    let!(:content1) { create(:content) }
    let!(:content2) { create(:content) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: content2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([content2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:content1) { create(:content) }
      let!(:content2) { create(:content) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            content1.id,
            content2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            content2.id,
            content1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
