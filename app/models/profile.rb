class Profile < ApplicationRecord
    belongs_to :user

    validates :profile_a, length: { maximum: 140 }

    enum profile_q_number:
    %i(好きな食べ物なんですか
        好きな色はなんですか？
        海派？それとも山派？
        猫が好きですよね？
        今日は何の日ですか？
        私と遊びに行きませんか？
        好きな映画は何ですか？
        小学校の思い出を教えてください。
        尊敬している人は誰ですか？
        愛読書は何ですか？
    )
end
