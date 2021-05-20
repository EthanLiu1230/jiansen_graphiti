shared_examples_for 'authorize admin' do
  it "returns false when the user is not admin nor super_admin" do
    is_expected.to eq false
  end

  context "when user is admin" do
    let(:user) { build_stubbed(:user, role: :admin) }
    it { is_expected.to eq true }
  end

  context 'when user is super_admin' do
    let(:user) { build_stubbed(:user, role: :super_admin) }
    it { is_expected.to eq true }
  end
end