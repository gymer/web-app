class App < ActiveRecord::Base
  include AccessTokenGenerator
  belongs_to :user
  after_initialize :generate_access_tokens

  def generate_access_tokens
    self.server_access_token = generate_access_token_for_column(:server_access_token)
    self.client_access_token = generate_access_token_for_column(:client_access_token)
  end
end
