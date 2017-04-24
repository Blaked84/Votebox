class ProjectsMember < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validate :user_dont_join_more_than_once, on: :create

  def user_dont_join_more_than_once
    error.add(:base, "user can't join several time a project") if user.projects.include?(self.project)
  end
end
