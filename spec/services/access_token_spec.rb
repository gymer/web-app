require 'rails_helper'

describe AccessToken do

  describe ".generate" do
    it 'returns random access token 16 char length' do
      access_token = AccessToken.generate
      expect(access_token.length).to eq 16
      expect(AccessToken.generate).to_not eq access_token
    end
  end

  describe ".generate_unique" do
    it 'generate random access token validated by passed function' do
      tokens = []
      1000.times { tokens << AccessToken.generate }

      unique_token = AccessToken.generate_unique {|token| !tokens.include?(token) }
      expect(tokens.include?(unique_token)).to be_falsy
    end

    it 'raise exception if passed validation funtion always return false' do
      expect{AccessToken.generate_unique {|token| false }}.to raise_error(RuntimeError)
    end
  end

end


