require "rails_helper"

RSpec.describe Page, type: :model do
  it "is not valid without a slug" do
    expect(Page.new(slug: nil)).to_not be_valid
  end
end
