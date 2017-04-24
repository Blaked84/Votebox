class Project < ActiveRecord::Base

  has_many :projects_members
  has_many :users, through: :projects_members
  belongs_to :category
  belongs_to :author, foreign_key: "user_id", class_name: "User"

  acts_as_voteable

  def initialize
    author ||= current_user
  end

  def self.featured
    self.plusminus_tally.first(5)
  end

  def author_name
    author.present? ? author.fullname : "pas d'auteur"
  end

end
