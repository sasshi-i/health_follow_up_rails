class UsersController < ApplicationController
  # TODO: 将来対応
  # クエリパラメーター: userName, address, disclose_id, is_alert
  def index
    if params["is_alert"]
      answer_ids = AnserOption.
                   where(is_alert: true).
                   answer_contents.
                   pluck(:answer_id)
      @users = User.where(id: Answer.where(id: answer_ids).pluck(:user_id)).
                    map(&:to_index_hash)
    else
      @users = User.all.map(&:to_index_hash)
    end
  end

  def show
    @user = User.find_by!(disclose_id: params["discloseId"]).to_show_hash
  end
end
