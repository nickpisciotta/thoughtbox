require 'rails_helper'

RSpec.describe Link, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:url) }

    it "should not validate invalid format urls" do
      link = Link.new(title: "Title", url: "notvalid")
      expect(link.valid?).to_not eq(true)
    end

    it "should validate valid format urls" do
      link = Link.new(title: "Valid Title", url: "http://goole.com")
    end
  end

  context "Associations" do
    it { should belong_to(:user) }
  end
end
