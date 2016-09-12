require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context "Associations" do
    it { should have_many(:links) }
  end
end
