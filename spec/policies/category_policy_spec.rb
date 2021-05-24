require 'rails_helper'
require 'shared/examples/authorize_admin'

describe CategoryPolicy do
  let(:user) { build_stubbed(:user, role: nil) }
  let(:category) { build_stubbed(:category) }
  let(:policy) { described_class.new(category, user: user) }

  describe '#create?' do
    subject { policy.apply(:create?) }

    it_behaves_like 'authorize admin'
  end

  describe '#update?' do
    subject { policy.apply(:update?) }
    it_behaves_like 'authorize admin'
  end

  describe '#destroy?' do
    subject { policy.apply(:destroy?) }
    it_behaves_like 'authorize admin'
  end

  describe '#index?' do
    subject { policy.apply(:index?) }
    it { is_expected.to eq true }
  end

  describe '#show?' do
    subject { policy.apply(:show?) }
    it { is_expected.to eq true }
  end
end