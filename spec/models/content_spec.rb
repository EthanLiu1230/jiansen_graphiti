require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:images) do
    [
      fixture_file_upload('test1.png', 'image/png'),
      fixture_file_upload('test2.png', 'image/png')
    ]
  end
  describe '#images' do
    subject do
      content = create(:content)
      content.images.attach(images)
      content
    end

    it 'has access to image id' do
      expect(subject.images[0]).to respond_to(:id)
    end

    it 'can find single image by id' do
      target = subject.images[0]
      expect(subject.images.find(target.id)).to eq(target)
    end

    it 'can delete single image by id' do
      target_id = subject.images[0].id
      expect {
        subject.images.find(target_id).purge
      }.to change { subject.images.count }.by(-1)
      expect(subject.images.attached?).to be true
    end

    it 'can delete all images' do
      expect {
        subject.images.purge
      }.to change {subject.images.count}.by(-2)
      expect(subject.images.attached?).to be false
    end
  end
end
