require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
    #Values for topic
    let(:name) {RandomData.random_sentence}
    let(:description) {RandomData.random_paragraph}
    
    #Values for sponsoredPost
    let(:title) {RandomData.random_sentence}
    let(:body) {RandomData.random_paragraph}
    let(:price) {99}
    
    #Instanciate Topic and SponsoredPost
    let(:topic) {Topic.create!(name: name, description: description)}
    let(:sponsored_post) {topic.sponsored_posts.create!(title: title, body: body, price: price)}
    
    it {is_expected.to belong_to(:topic)}

    describe "attributes" do
        it "has title, body, and price attributes" do
            expect(sponsored_post).to have_attributes(title: title, body: body, price: price) 
        end
    end
end