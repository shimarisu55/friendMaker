require 'rails_helper'

  RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  before do
    User.create(
      name:  "シマリス",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
      )
  end

    # 姓、名、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, icon_animal, icon_color, email, and password" do
      user = User.new(
        name: "Aaron",
        icon_animal:  1,
        icon_color: 2,
        email:      "aaron@example.com",
        password:   "aaronaaron",
      )
      expect(user).to be_valid
    end

    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      user = FactoryBot.build(:user, email: "tester@example.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    # 二人のユーザーが同じ名前,同じアイコンを使うことは許可すること
    it "allows two users to have a same name" do
      other_user = User.create(
        name: "シマリス",
        icon_animal: 0,
        icon_color: 0,
        email: "risu@risu",
        password:   "dottle-nouveau-pavilion-tights-furze",
      )
      expect(other_user).to be_valid
    end


  end
