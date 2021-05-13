class AuthenticationTokenService
  ALGORITHM_TYPE = 'HS256'
  HMAC_SECRET = 'my$ecretK3y'

  def self.call(payload)
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end
end