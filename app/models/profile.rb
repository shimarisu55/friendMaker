class Profile < ApplicationRecord
    belongs_to :user

    validates :profile_a, length: { maximum: 140 }

    enum profile_q_number:
    %i(んぐり一緒にどうですか？
        好きな色はなんですか？
        Twitterのフォロワー数は何桁？
        文系？理系？体育会系？
        今日は何の日ですか？
        今日嬉しかった出来事を教えて
        大好きな友達のことについて語ってください
        猫が好きですよね？
        尊敬している人は誰ですか？
        愛読書は何ですか？
    )
end
