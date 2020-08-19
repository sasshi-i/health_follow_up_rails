class ApplicationController < ActionController::Base
  include Knock::Authenticable
  around_action :api_wrapper

  def api_wrapper
    # TODO: 認証の実装

    # 各アクションメソッドの実行
    yield
  end
end
