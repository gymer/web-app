module AccessTokenGenerator
  MAX_ACCESS_TOKEN_GENERATION_ATTEMPTS = 10

  def generate_access_token_for_column(column_name)
    attempts = 0
    access_token = nil

    begin
      attempts += 1
      access_token = AccessToken.generate
      is_not_unique = self.class.exists?(column_name => access_token)
      is_not_reached_max_attempts = attempts < MAX_ACCESS_TOKEN_GENERATION_ATTEMPTS
    end while is_not_unique && is_not_reached_max_attempts

    raise 'Incorrect column' unless is_not_reached_max_attempts

    access_token
  end
end
