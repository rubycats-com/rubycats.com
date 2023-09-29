require "rails_helper"

RSpec.describe User, type: :model do
  describe ".find_omniauth" do
    let(:auth) { OmniAuth::AuthHash.new(provider: "gihub", uid: "123", info: {email: "test@test.com", name: "test_name", nickname: "test_nickname"}, extra: {raw_info: {avatar_url: "http://github.com/"}}) }
    let(:service) { double("User::FindForOauth") }

    it ".find_omniauth" do
      expect(User.find_by(email: "test@test.com", name: "test_name", nickname: "test_nickname", avatar_url: "http://github.com/")).to be_falsey
      expect { User.find_for_oauth(auth) }.to change(User, :count).by(1)
      expect(User.find_by(email: "test@test.com", name: "test_name", nickname: "test_nickname", avatar_url: "http://github.com/")).to be_truthy
    end
  end
end
