require 'rails_helper'

RSpec.describe Question, type: :model do
  # ユーザーは一人のユーザーに２つ以上のquestionテーブルをもてない
  it "does not allow having two question tables per user" do
    user = User.create(
      name: "Joe",
      email:      "joetester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
      )
    friend = User.create(
      name: "Aaron",
      email:      "aaron@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
      )
  
      user.q_user_questions.create(
        user_q_id: user.id,
        user_a_id: friend.id
      )
      new_question = user.q_user_questions.new(
        user_q_id: user.id,
        user_a_id: friend.id
      )
      new_question.valid?
      expect(new_question.errors[:user_q_id]).to include("はすでに存在します")
  end


  
  


end
