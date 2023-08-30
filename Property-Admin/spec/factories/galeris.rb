FactoryBot.define do
  factory :galeri do
    title { Faker::Lorem.sentence(word_count: 3) }
    content {  Faker::Lorem.paragraph(sentence_count: 3) }
    Account { FactoryBot.create(:account) }
  

  after(:build) do |foto|
    foto.image.attach(
      io: File.open(Rails.root.join('spec','test-storage','images','test.jpg')),
      filename: 'test.jpg',
      content_type: 'image/jpeg'
    )
  end	
end
end
