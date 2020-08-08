class ApplicationController < ActionController::Base
  attr_reader :current_user

  # TODO: 認証の実装
  @current_user = User.find(1)
end
