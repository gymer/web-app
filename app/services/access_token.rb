class AccessToken

  def self.generate
    SecureRandom.hex[0..15]
  end

end
