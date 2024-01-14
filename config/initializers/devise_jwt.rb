
Devise.setup do |config|
    config.jwt do |jwt|
      jwt.secret = 'your_secret_key'
      jwt.dispatch_requests = [['POST', %r{^/api/sessions$}]]
      jwt.revocation_requests = [['DELETE', %r{^/api/sessions$}]]
      jwt.expiration_time = 1.day.to_i
    end
  end