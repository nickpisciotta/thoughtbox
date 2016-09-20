require 'rails_helper'

RSpec.describe Link, type: :model do
  context "Validations" do
    it { is_expected.to validate_presence_of(:url) }

    it "should not validate invalid format urls" do
      user = create_user
      link = user.links.new(title: "Title", url: "notvalid")
      expect(link.valid?).to_not eq(true)
    end

    it "should validate valid format urls" do
      user = create_user
      link = user.links.create("title" => "will work", "url" => "www.amazon.com")
      expect(link.valid?).to eq(true)
    end
  end

  context "Associations" do
    it { should belong_to(:user) }
  end

  context "#change_status" do
    it "should change link read status" do
      user = create_user
      link  = user.links.create("title" => "will work", "url" => "www.amazon.com")

      expect(link.read).to eq(false)

      link.change_status

      expect(link.read).to eq(true)
    end 
  end
end
