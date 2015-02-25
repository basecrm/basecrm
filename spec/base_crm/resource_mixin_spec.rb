require "spec_helper"

class ResourceMixinTestClass < ApiClient::Resource::Base
  include BaseCrm::Resource
end

describe BaseCrm::Resource do

  describe "#pass_headers" do
    let(:instance) { ResourceMixinTestClass.headers(headers).build_one({}) }
    let(:token_name) { BaseCrm.config.token_name }
    let(:token) { double }
    let(:headers) do
      { token_name => token }
    end
    let(:other_klass) { double }

    it "copies the token header from the original scope" do
      expect(other_klass).to receive(:headers).with(token_name => token)

      instance.pass_headers(other_klass)
    end

  end

end

