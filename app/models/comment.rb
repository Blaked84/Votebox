class Comment < ActiveRecord::Base

  belongs_to :project
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"

  validates_presence_of :user_id
  validates_presence_of :project_id
  validates_presence_of :text
end
