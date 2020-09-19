class User < ApplicationRecord
  has_secure_password

  # TODO: バリデーション
  belongs_to :prefecture
  belongs_to :user_status
  has_many :referral_hospitals
  has_many :answers
  has_many :answer_comments

  def to_index_hash
    {
      discloseId: self.disclose_id,
      firstName: self.first_name,
      lastName: self.last_name,
      gender: self.gender,
      prefecture: Prefecture.find(self.prefecture_id).name,
      address: self.address,
      birthOn: self.birth_on,
      homeRemedyStartOn: self.home_remedy_start_on,
      userStatusId: self.user_status_id,
      isAlert: is_alert,
    }
  end

  def to_show_hash
    {
      discloseId: self.disclose_id,
      firstName: self.first_name,
      lastName: self.last_name,
      gender: self.gender,
      homeRemedyStartOn: self.home_remedy_start_on,
      affiliation: self.affiliation,
      address: self.address,
      phoneNumber: self.phone_number,
      prefectureId: self.prefecture_id,
      userStatusId: self.user_status_id,
      emai: self.email,
      is_alert: is_alert,
    }
  end

  private

  def is_alert
    answer_ids = self.answers.pluck(:id)
    answer_option_ids = AnswerContent.where(id: answer_ids).pluck(:answer_option_id)
    AnswerOption.where(id: answer_option_ids).pluck(:is_alert).any?
  end
end
