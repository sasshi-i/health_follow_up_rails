class UserTokenController < Knock::AuthTokenController
  protect_from_forgery :except => [:create]
end
