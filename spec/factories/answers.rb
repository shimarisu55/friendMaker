FactoryBot.define do
  factory :answer do
    question_id { 1 }
    first_content { "MyString" }
    second_content {"second"}
    third_content {"third"}
  end
end
