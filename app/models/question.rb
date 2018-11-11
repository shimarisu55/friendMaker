class Question < ApplicationRecord
    belongs_to :q_user, class_name: 'User', :foreign_key => 'user_q_id'
    belongs_to :a_user, class_name: 'User', :foreign_key => 'user_a_id'
    has_one :answer, dependent: :destroy
    accepts_nested_attributes_for :answer
    has_one :original, dependent: :destroy
    accepts_nested_attributes_for :original
    validates_uniqueness_of :user_q_id, :scope => :user_a_id


    enum first_q_number:
    %i(どんぐり一緒にどうですか？
        私が誰だか当ててくれませんか？
        猫が好きですよね？
        今日は何の日ですか？
        文系？理系？体育会系？
        自分を動物に例えると何？理由も教えて
        Twitterのフォロワー数は何桁？
        今の仕事は好き？
        オリジナル質問
    )
    enum second_q_number:
    %i(あなたの「好き」について語って！
        人生の成功経験について語って
        好きな映画は何ですか？
        尊敬している人や師匠の思い出を教えて
        今日嬉しかった出来事を教えて
        大好きな友達のことについて語ってください
        愛読書は何ですか？
        １ヶ月の長期休暇が取れました。何する？
        オリジナル
    )
    enum third_q_number:
    %i(何をされたら怒る？
        私はどんな立ち位置になれそう？友達？恋人？家族？
        ポエムを作ってよ。
        私と遊びに行くならどこに行きたい？
        オリジナルの質問です
    )

    def non_delete_user
        q_user = User.with_deleted.find(user_q_id)
        if q_user.deleted_at == nil
            q_user.name
        else
            "退会ユーザー"
        end
    end

    def non_delete_user_icon
        q_user = User.with_deleted.find(user_q_id)
        if q_user.deleted_at == nil
            ActionController::Base.helpers.image_tag "animalicon/icon#{q_user.icon_animal}_#{q_user.icon_color}.png", size: "80x80"
        else
            ActionController::Base.helpers.image_tag "animalicon/icon10_10.png", size: "80x80"
        end
    end

end
