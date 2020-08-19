class AnswersController < ApplicationController
  before_action :authenticate_user
  #
  # answers: [
    # {
        # answer_option_id: 1,
        # content: string,
        # question_id: 1,        
    # }
  # ]
  #
  #
  def create
    ActiveRecord::Base.transaction do
      answer = Answer.create!({ user: current_user })

      params["answers"].each do |ans|
        AnswerContent.create!({
          answer_option_id: ans["answerOptionId"],
          content: ans["content"],
          answer_id: answer.id,
          question_id: ans["questionId"],
        })
      end
    end
  end

  # answers: [
    # {
        # answerContentId: 1,
        # answerOptionId: 1,
        # content: string,
        # questionId: 1,        
    # }
  # ]
  #
  #
  def update
    params["answers"].each do |ans|
      ans_cont = AnswerContent.find(params["answerContentId"])
      ans_data = ans.permit(:answerOptionId, :content, :questionId).to_hash
      
      ans_cont.update!(ans_data)
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      ans = Answer.find(params["answerId"])
      ans.update!(is_deleted: true)
      ans.answer_contents.update_all(is_deleted: true)
      ans.answer_comment.update!(is_deleted: true)
    end
  end
end
