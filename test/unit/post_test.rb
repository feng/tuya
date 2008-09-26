require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def test_must_have_not_nil_title
    post = Post.new(:title => nil, :content => "this is a test.")

    assert !post.valid?
    assert post.errors.invalid?(:title)
  end

  def test_must_have_not_empty_title
    post = Post.new(:title => '', :content => "this is a test.")

    assert !post.valid?
    assert post.errors.invalid?(:title)
  end

  def test_must_have_created_date
    post = Post.new(:title => 'this title', :content => "this is a test.")
    assert !post.created_at.nil?
  end
end
