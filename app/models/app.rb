class App < ActiveRecord::Base
  before_create :generate_access_tokens
  belongs_to :user

  def generate_access_tokens
    self.server_access_token = AccessToken.generate_unique {|access_token| !self.class.exists?(server_access_token: access_token)}
    self.client_access_token = AccessToken.generate_unique {|access_token| !self.class.exists?(client_access_token: access_token)}
  end
end
