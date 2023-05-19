# frozen_string_literal: true

require "version"

RSpec.describe Version do
  describe "#version_case" do
    context "when check the version" do
      it "has a some number" do
        expect(Version::VALUE).not_to be nil
      end
    end
  end
end
