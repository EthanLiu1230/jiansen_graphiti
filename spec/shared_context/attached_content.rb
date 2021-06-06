shared_context 'attached content' do
  let!(:content) { create(:content) }
  before(:example) do
    content.images.attach([
      fixture_file_upload('test1.png', 'image/png'),
      fixture_file_upload('test2.png', 'image/png'),
    ])
  end
end