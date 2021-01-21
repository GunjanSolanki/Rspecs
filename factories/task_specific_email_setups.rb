FactoryBot.define do
  factory :task_specific_email_setup do
    title { "Test Title" }
    sender_name { "Test Sender" }
    from_email { Faker::Internet.email }
    subject { "Test Subject" }
    content { "Test Content" }
    code { "Test Code" }
    bcc { "Test Bcc" }
    association :task
  end
end
