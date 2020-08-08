class UsersController < ApplicationController
  # TODO: 将来対応
  # クエリパラメーター: userName, address, disclose_id
  def index
    @users = User.all.map(&:to_index_hash)
  end

  def show
    @user = User.find_by!(disclose_id: params["discloseId"]).to_show_hash
  end
end
