class Comment < ActiveRecord::Base
  validates_presence_of :author_name
  validates_presence_of :email
end
