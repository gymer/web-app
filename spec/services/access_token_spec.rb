require 'rails_helper'

describe AccessToken do

  describe ".generate" do
    it 'returns random access token 16 char length' do
      access_token = AccessToken.generate
      expect(access_token.length).to eq 16
      expect(AccessToken.generate).to_not eq access_token
    end
  end

end


