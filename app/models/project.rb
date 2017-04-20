class Project < ActiveRecord::Base

  has_many :projects_members
  has_many :users, through: :projects_members
  belongs_to :category

  acts_as_voteable

  def self.featured
    self.plusminus_tally.first(5)
  end

  def author
    User.first.fullname
  end

end
