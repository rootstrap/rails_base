require "spec_helper"

RSpec.describe Rails::Base do
  it "has a version number" do
    expect(Rails::Base::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
