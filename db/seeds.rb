require 'random_data'

50.times do
    
    Post.create!(
        title: RandomData.random_sentence,
        body:  RandomData.random_sentence
    )
end
posts = Post.all

100.times do 
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Post.find_or_create_by!(
    title: "Unique title",
    body: "Unique body"
)
Comment.find_or_create_by!(
    post: Post.find_or_create_by(title: "Unique title"),
    body: "Unique comment"
)