class UserTokenController < Knock::AuthTokenController
  protect_from_forgery :except => [:create]

  def create
    cookies[:jwt] = { 
                      value: auth_token.token,
                      expires: 1.day.from_now,
                      same_site: "None",
                      secure: true
                    }
    super
  end
end
