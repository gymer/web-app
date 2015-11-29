class AccessToken

  def self.generate_unique(&validation)
    i = 0

    begin
      i += 1
      token = generate
      token_valid = validation.call(token)
    end while !token_valid && i <= 50

    raise 'Incorrect validation expression (always return false).' unless token_valid
    token
  end

  def self.generate
    SecureRandom.hex[0..15]
  end

end
