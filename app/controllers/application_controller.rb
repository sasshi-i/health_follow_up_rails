class ApplicationController < ActionController::Base
  attr_reader :current_user
  around_action :api_wrapper

  def api_wrapper
    # TODO: 認証の実装
    @current_user = User.find(1)

    # 各アクションメソッドの実行
    yield
  end
end
