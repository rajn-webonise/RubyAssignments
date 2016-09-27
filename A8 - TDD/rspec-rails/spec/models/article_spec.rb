require 'rails_helper'



RSpec.describe Article, :type => :model do

  it "orders by last name" do
    articleA = Article.create!(title: "A Test Title", text: "Lots of body!")
    articleZ = Article.create!(title: "Z Test Title 2", text: "Lots of more body!")
    articleB = Article.create!(title: "B Test Title 2", text: "Lots of more body!")
    expect(Article.all.sort_by(&:title)).to eq([articleA, articleB, articleZ])
  end

  it "should not save article without title" do
    article = Article.new
    expect(article.save).to eq(false)
  end

  it "should have title with length minimum 5" do
    article_small_title = Article.create(title: "A", text: "Lots of body!")
    expect(article_small_title.save).to eq(false)
  end

  it "can have comments" do
    articleA = Article.create!(title: "A Test Title", text: "Lots of body!")
    commentA = articleA.comments.create(commenter: "Shirish", body: "Nice article")
    commentB = articleA.comments.create(commenter: "Raj", body: "Thanks")
    expect(commentA.save).to eq(true)
    expect(commentB.save).to eq(true)
  end


end
