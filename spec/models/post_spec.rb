require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(:title => 'test', :content => "This is a test.")
  end
  
  it "should have a title" do
    post = Post.new
    post.should have(1).errors_on(:title)
  end
  
  it "should have a default created date" do 
    post = Post.create!(:title => 'test', :content => "This is a test.")
    post.created_at.should_not be_blank
  end
  
  it "should have a blank updated date" do
    post = Post.create!(:title => 'test', :content => "This is a test.")
    post.updated_at.should be_blank
  end
end
