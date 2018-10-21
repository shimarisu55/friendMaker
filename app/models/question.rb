class Question < ApplicationRecord
    belongs_to :q_user, class_name: 'User', :foreign_key => 'user_q_id'
    belongs_to :a_user, class_name: 'User', :foreign_key => 'user_a_id'
    has_one :answer, dependent: :destroy
    accepts_nested_attributes_for :answer
    has_one :original, dependent: :destroy
    accepts_nested_attributes_for :original


    enum first_q_number:
    %i(好きな食べ物なんですか
        好きな色はなんですか？
        海派？それとも山派？
        猫が好きですよね？
        4つめ
        ５つ目
        ６つ目
        ７つ目
        ８つ目
        オリジナル質問
    )
    enum second_q_number:
    %i(質問を選んでください
        私と遊びに行きませんか？
        好きな映画は何ですか？
        小学校の思い出を教えてください。
        尊敬している人は誰ですか？
        愛読書は何ですか？
    )
    enum third_q_number:
    %i(質問
        ２つ目の質問です
        ３つ目の質問です
        ４つ目の質問です
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
