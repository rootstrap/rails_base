  context 'when was created with facebook login' do
    subject { build :user, :with_fb }
    it { should_not validate_uniqueness_of(:email) }
    it { should_not validate_presence_of(:email) }
  end
