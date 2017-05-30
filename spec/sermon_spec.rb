require "spec_helper"

RSpec.describe Sermon do
  it "has a version number" do
    expect(Sermon::VERSION).not_to be nil
  end
end
