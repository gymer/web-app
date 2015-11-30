require 'rails_helper'

describe AccessTokenGenerator do

  describe "#generate_access_token_for_column" do
    before :all do
      @app = build(:app, name: "Example", user: @user)
    end

    it 'generate random access token for ActiveRecord column and validate unique' do
      expect(@app.server_access_token.length).to eq 16
      expect(@app.client_access_token.length).to eq 16
      expect(@app.server_access_token).to_not eq @app.client_access_token
    end

    it 'raise exception if passed column not exist' do
      expect{@app.generate_access_token_for_column(:non_existing_column)}.to raise_error(ActiveRecord::StatementInvalid)
    end
  end

end
