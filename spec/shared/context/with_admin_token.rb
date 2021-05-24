RSpec.shared_context 'with_admin_token' do
  let!(:user) { create(:user, role: :admin) }
  let(:with_admin_token) do
    access_token = jwt_and_refresh_token(user, 'user')[0]
    { 'Authorization': "Bearer #{access_token}" }
  end
end