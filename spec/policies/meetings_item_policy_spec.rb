require 'rails_helper'

RSpec.describe MeetingsItemPolicy, type: :policy do
  let(:user) { User.new }

  subject { described_class }

  permissions :destroy? do
    it "deletes an item if administrator only" do
      expect(subject).to permit(user, MeetingsItem.delete())
    end
  end
end
