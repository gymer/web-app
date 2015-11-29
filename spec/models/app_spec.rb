require 'rails_helper'

describe App do
  describe "#generate_access_tokens" do
    before :all do
      @app = build(:app, user: @user)
    end

    it 'generate unique server_access_token and client_access_token' do
      @app.generate_access_tokens

      expect(@app.server_access_token.length).to eq 16
      expect(@app.client_access_token.length).to eq 16
      expect(@app.server_access_token).to_not eq @app.client_access_token
      expect(@app.save).to be_truthy
    end
  end
end


