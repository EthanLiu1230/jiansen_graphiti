RSpec.shared_context 'with token' do

  let!(:user) { create(:user, email: 'admin@test.com', role: :admin) }

  def bear_admin_token(headers = {})
    access_token = jwt_and_refresh_token(user, 'user')[0]
    headers.tap { |h| h['Authorization'] = "Bearer #{access_token}" }
  end

  let!(:super_admin) { create(:user, email: 'super_admin@test.com', role: :super_admin) }

  def bear_super_admin_token(headers = {})
    access_token = jwt_and_refresh_token(super_admin, 'user')[0]
    headers.tap { |h| h['Authorization'] = "Bearer #{access_token}" }
  end

end