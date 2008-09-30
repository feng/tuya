require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post, "with fixtures loaded" do
  fixtures :posts

  before(:each) do
  end

  it "should have a non-empty collection of posts" do
    Post.find(:all).should_not be_empty
  end

  it "should find an existing post" do
    post = Post.find(posts(:first_post).id)
    post.should eql(posts(:first_post))
  end

end

describe Post, "with a title" do
  fixtures :posts

  before(:each) do
    @post = Post.new(:title => "this is a test")
  end

  it "should be valid" do
    @post.should be_valid
  end

  it "should have no errors after save" do
    @post.save.should be_true
    @post.errors.should be_empty
  end

  it "should have one error if title is nil" do
    @post.title = nil
    @post.save.should_not be_true
    @post.errors.should have(1).error_on(:title) 
  end

  it "should have one error if title is empty" do
    @post.title = ''
    @post.save.should_not be_true
    @post.errors.should have(1).error_on(:title) 
  end
end

describe Post, "generate date value automatically" do
  before(:each) do
    @post = Post.new(:title => "this is second test")
  end

  it "should have a created_at date" do
    @post.created_at.should_not be_blank
  end
  
  it "should have a blank updated date" do
    @post.updated_at.should be_blank
end
