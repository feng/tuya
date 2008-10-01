require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment, "with fixtures loaded" do
  fixtures :comments
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should have a non-empty collection of Comment" do
    Comment.find(:all).should_not be_empty
  end
  
  it "should find an existing comment" do
    comment = Comment.find(comments(:first).id)
    comment.should eql(comments(:first))
  end
end

describe Comment, "with a author name" do
  fixtures :comments
  
  before(:each) do
    @comment = Comment.new(:author_name => "David", :email => "david@dwfeng.net")
  end
  
  it "should be valid" do
    @comment.should be_valid
  end
  
  it "should have no errors after save" do
    @comment.save.should be_true
    @comment.errors.should be_empty
  end
  
  it "should have a errors if author name is nil" do
    @comment.author_name = nil
    @comment.save.should_not be_true
    @comment.errors.should have(1).error_on(:author_name)
  end
  
  it "should have a errors if auhtor name is blank" do
    @comment.author_name = ""
    @comment.save.should_not be_true
    @comment.errors.should have(1).error_on(:author_name)
  end
  
  it "should have a errors if email is nil" do
    @comment.email = nil
    @comment.save.should_not be_true
    @comment.errors.should have(1).error_on(:email)
  end

  it "should have a errors if email is empty" do
    @comment.email = ""
    @comment.save.should_not be_true
    @comment.errors.should have(1).error_on(:email)
  end
end